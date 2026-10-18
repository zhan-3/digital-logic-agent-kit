param(
    [Parameter(Mandatory = $true)][string]$Top,
    [Parameter(Mandatory = $true)][string[]]$Sources,
    [Parameter(Mandatory = $true)][string[]]$Constraints,
    [Parameter(Mandatory = $true)][string]$VivadoBin,
    [Parameter(Mandatory = $true)][string]$Part,
    [string]$BuildDir = ''
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$vivado = Join-Path $VivadoBin 'vivado.bat'
if (!(Test-Path $vivado)) { throw "Vivado not found: $vivado" }
function ResolveP([string]$path) {
    if ([IO.Path]::IsPathRooted($path)) { return (Resolve-Path $path).Path.Replace('\','/') }
    return (Resolve-Path (Join-Path $root $path)).Path.Replace('\','/')
}
if (!$BuildDir) { $BuildDir = "build/vivado-$Top" }
$build = if ([IO.Path]::IsPathRooted($BuildDir)) { $BuildDir } else { Join-Path $root $BuildDir }
New-Item -ItemType Directory -Force -Path $build | Out-Null
$tcl = Join-Path $build 'run-flow.tcl'
$prefix = $build.Replace('\','/')
$lines = @("create_project -in_memory -part $Part")
foreach ($source in $Sources) {
    $p = ResolveP $source
    if ([IO.Path]::GetExtension($source) -ieq '.sv') { $lines += "read_verilog -sv {$p}" }
    else { $lines += "read_verilog {$p}" }
}
foreach ($constraint in $Constraints) { $lines += "read_xdc {$(ResolveP $constraint)}" }
$lines += @(
    "synth_design -top $Top -part $Part",
    'opt_design',
    'place_design',
    'route_design',
    "report_utilization -file {$prefix/utilization.rpt}",
    "report_timing_summary -file {$prefix/timing_summary.rpt}",
    "report_drc -file {$prefix/drc.rpt}",
    "write_bitstream -force {$prefix/$Top.bit}",
    'puts "FLOW_COMPLETED"',
    'exit 0'
)
$lines | Set-Content -Path $tcl -Encoding ASCII
Push-Location $build
try {
    & $vivado -mode batch -source $tcl -nolog -nojournal
    if ($LASTEXITCODE -ne 0) { throw "Vivado flow failed: $LASTEXITCODE" }
} finally { Pop-Location }
if (!(Test-Path (Join-Path $build "$Top.bit"))) { throw 'Bitstream not produced' }
Write-Host "[pass] $build\$Top.bit (not board-tested)" -ForegroundColor Green
