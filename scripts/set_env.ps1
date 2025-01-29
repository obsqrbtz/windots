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
        $value = $matches[2]
        [System.Environment]::SetEnvironmentVariable($key, $value, [System.EnvironmentVariableTarget]::Process)
        Write-Output "Set environment variable: $key = $value"
    }
}

Write-Output "Environment variables loaded from $envFilePath"
