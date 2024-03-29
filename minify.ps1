Write-Host "Minifying web resources..."

$webResourceSrc = "webresource-src"
$webResourceSrcHolding = "webresource-src-holding"

if (!(Test-Path -Path $webResourceSrcHolding)) {
    New-Item -ItemType directory -Path $webResourceSrcHolding
}

Copy-Item -Path "$webResourceSrc\*" -Destination $webResourceSrcHolding
$files = Get-ChildItem -Path $webResourceSrc -Filter *.js

foreach ($file in $files) {
    uglifyjs $file.FullName -o $file.FullName
}