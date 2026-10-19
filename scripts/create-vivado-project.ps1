param(
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][string]$Top,
    [Parameter(Mandatory = $true)][string[]]$Sources,
    [Parameter(Mandatory = $true)][string]$SimTop,
    [Parameter(Mandatory = $true)][string[]]$SimFiles,
    [Parameter(Mandatory = $true)][string[]]$Constraints,
    [Parameter(Mandatory = $true)][string]$ProjectDir,
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

$out = if ([IO.Path]::IsPathRooted($ProjectDir)) { $ProjectDir } else { Join-Path $root $ProjectDir }
New-Item -ItemType Directory -Force -Path $out | Out-Null
$tcl = Join-Path $out 'create-project.tcl'
$projectPath = $out.Replace('\', '/')
$lines = @("create_project -force {$Name} {$projectPath} -part $Part")

foreach ($file in $Sources) {
    $lines += "add_files -norecurse {$(Resolve-RepoPath $file)}"
}
foreach ($file in $SimFiles) {
    $lines += "add_files -fileset sim_1 -norecurse {$(Resolve-RepoPath $file)}"
}
foreach ($file in $Constraints) {
    $lines += "add_files -fileset constrs_1 -norecurse {$(Resolve-RepoPath $file)}"
}
$lines += @(
    "set_property top {$Top} [get_filesets sources_1]",
    "set_property top {$SimTop} [get_filesets sim_1]",
    'update_compile_order -fileset sources_1',
    'update_compile_order -fileset sim_1',
    'puts "PROJECT_CREATED"',
    'exit 0'
)
$lines | Set-Content -Path $tcl -Encoding ASCII

& $vivado -mode batch -source $tcl -nolog -nojournal
if ($LASTEXITCODE -ne 0) { throw "Vivado project creation failed: $LASTEXITCODE" }
$xpr = Join-Path $out "$Name.xpr"
if (!(Test-Path $xpr)) { throw "Project not created: $xpr" }
Write-Host "[pass] $xpr" -ForegroundColor Green
