param (
    [string]$envFilePath = ".env"
)

if (-Not (Test-Path $envFilePath)) {
    Write-Error "Environment file not found: $envFilePath"
    return
}

$envFileContent = Get-Content $envFilePath

foreach ($line in $envFileContent) {
    if ($line -match '^(.+?)=(.+)$') {
        $key = $matches[1]
        if (Test-Path "Env:$key") {
            Remove-Item "Env:$key"
            Write-Output "Unset environment variable: $key"
        } else {
            Write-Output "Environment variable not found: $key"
        }
    }
}

Write-Output "Environment variables unloaded from $envFilePath"
