param(
    [Parameter(Mandatory = $true)][string]$Top,
    [Parameter(Mandatory = $true)][string[]]$Files,
    [Parameter(Mandatory = $true)][string]$VivadoBin,
    [string]$BuildDir = 'build/xsim'
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$resolved = @($Files | ForEach-Object {
    if ([IO.Path]::IsPathRooted($_)) { (Resolve-Path $_).Path }
    else { (Resolve-Path (Join-Path $root $_)).Path }
})
$build = if ([IO.Path]::IsPathRooted($BuildDir)) { $BuildDir } else { Join-Path $root $BuildDir }
New-Item -ItemType Directory -Force -Path $build | Out-Null
$runTcl = Join-Path $build 'run.tcl'
$marker = Join-Path $build 'completed.txt'
Remove-Item -Force -ErrorAction SilentlyContinue $marker,(Join-Path $build "$Top.wdb")
$tclMarker = $marker.Replace('\','/')
"log_wave -recursive *`nrun all`nset f [open {$tclMarker} w]`nputs `$f {XSIM_RUN_ALL_OK}`nclose `$f`nquit" |
    Set-Content -Path $runTcl -Encoding ASCII
Push-Location $build
try {
    & (Join-Path $VivadoBin 'xvlog.bat') --sv @resolved
    if ($LASTEXITCODE -ne 0) { throw "xvlog failed: $LASTEXITCODE" }
    & (Join-Path $VivadoBin 'xelab.bat') $Top -s "${Top}_snapshot" --debug typical
    if ($LASTEXITCODE -ne 0) { throw "xelab failed: $LASTEXITCODE" }
    & (Join-Path $VivadoBin 'xsim.bat') "${Top}_snapshot" -tclbatch ($runTcl.Replace('\','/')) -wdb "$Top.wdb"
    if ($LASTEXITCODE -ne 0) { throw "xsim failed: $LASTEXITCODE" }
} finally { Pop-Location }
if (!(Test-Path $marker) -or !(Test-Path (Join-Path $build "$Top.wdb"))) {
    throw 'Vivado simulator did not complete run all'
}
Write-Host "[pass] Vivado xsim: $build\$Top.wdb" -ForegroundColor Green
