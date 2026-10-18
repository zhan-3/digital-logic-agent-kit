param(
    [Parameter(Mandatory = $true)][string]$Top,
    [Parameter(Mandatory = $true)][string[]]$Files,
    [string]$BuildDir = 'build/iverilog'
)
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$iverilog = (Get-Command iverilog -ErrorAction Stop).Source
$vvp = (Get-Command vvp -ErrorAction Stop).Source
$resolvedFiles = @($Files | ForEach-Object {
    if ([IO.Path]::IsPathRooted($_)) { (Resolve-Path $_).Path }
    else { (Resolve-Path (Join-Path $root $_)).Path }
})
$build = if ([IO.Path]::IsPathRooted($BuildDir)) { $BuildDir } else { Join-Path $root $BuildDir }
New-Item -ItemType Directory -Force -Path $build | Out-Null
$output = Join-Path $build "$Top.out"
& $iverilog -g2012 -Wall -s $Top -o $output @resolvedFiles
if ($LASTEXITCODE -ne 0) { throw "iverilog failed: $LASTEXITCODE" }
Push-Location $build
try {
    & $vvp $output
    if ($LASTEXITCODE -ne 0) { throw "vvp failed: $LASTEXITCODE" }
} finally { Pop-Location }
Write-Host "[pass] $Top simulation completed" -ForegroundColor Green
