Set-Location (Split-Path $PSScriptRoot -Parent)

git add -A

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

git diff --cached --quiet

if ($LASTEXITCODE -eq 0) {
    Write-Host "No changes to upload."
    exit 0
}

git commit -m "Automatic update from VS Code"

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}

git push

exit $LASTEXITCODE