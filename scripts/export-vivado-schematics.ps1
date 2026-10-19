param(
    [Parameter(Mandatory = $true)][string]$Top,
    [Parameter(Mandatory = $true)][string[]]$Sources,
    [Parameter(Mandatory = $true)][string]$OutputDir,
    [Parameter(Mandatory = $true)][string]$VivadoBin,
    [string]$Part = 'xc7a50tcsg324-1'
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$vivado = Join-Path $VivadoBin 'vivado.bat'
if (!(Test-Path $vivado)) { throw "Vivado not found: $vivado" }

function Resolve-RepoPath([string]$Path) {
    $candidate = if ([IO.Path]::IsPathRooted($Path)) { $Path } else { Join-Path $root $Path }
    return (Resolve-Path $candidate).Path.Replace('\', '/')
}

$sources = @($Sources | ForEach-Object { Resolve-RepoPath $_ })
$out = if ([IO.Path]::IsPathRooted($OutputDir)) { $OutputDir } else { Join-Path $root $OutputDir }
New-Item -ItemType Directory -Force -Path $out | Out-Null
$work = Join-Path $root "build\schematic-$Top"
New-Item -ItemType Directory -Force -Path $work | Out-Null
$tcl = Join-Path $work 'export-schematics.tcl'
$rtl = (Join-Path $out "$Top-rtl.svg").Replace('\', '/')
$synth = (Join-Path $out "$Top-synthesis.svg").Replace('\', '/')
$lines = @("create_project -in_memory -part $Part")
foreach ($source in $sources) {
    if ([IO.Path]::GetExtension($source) -ieq '.sv') { $lines += "read_verilog -sv {$source}" }
    else { $lines += "read_verilog {$source}" }
}
$lines += @(
    "synth_design -rtl -top $Top -part $Part",
    "show_schematic [get_cells -hierarchical] -name rtl_$Top",
    "write_schematic -force -format svg -orientation landscape -scope all -name rtl_$Top {$rtl}",
    'close_design',
    "synth_design -top $Top -part $Part",
    "show_schematic [get_cells -hierarchical] -name synth_$Top",
    "write_schematic -force -format svg -orientation landscape -scope all -name synth_$Top {$synth}",
    'puts "SCHEMATICS_EXPORTED"',
    'exit 0'
)
$lines | Set-Content -Path $tcl -Encoding ASCII

Push-Location $work
try {
    & $vivado -mode gui -source $tcl -nolog -nojournal
    if ($LASTEXITCODE -ne 0) { throw "Vivado schematic export failed: $LASTEXITCODE" }
} finally {
    Pop-Location
}
if (!(Test-Path (Join-Path $out "$Top-rtl.svg")) -or !(Test-Path (Join-Path $out "$Top-synthesis.svg"))) {
    throw 'Expected schematic files were not created'
}
Write-Host "[pass] $rtl" -ForegroundColor Green
Write-Host "[pass] $synth" -ForegroundColor Green
