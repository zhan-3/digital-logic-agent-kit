param(
    [int]$Port = 8000
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$mirror = Join-Path $root 'course-site-mirror'
$index = Join-Path $mirror '10.245.130.67\digital\index.html'
if (!(Test-Path $index)) { throw "Mirror index not found: $index" }

Write-Host "Open http://localhost:$Port/10.245.130.67/digital/index.html" -ForegroundColor Cyan
python -m http.server $Port --directory $mirror
