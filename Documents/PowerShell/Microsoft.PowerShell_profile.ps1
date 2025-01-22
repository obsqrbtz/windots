Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

Remove-Item Alias:cd -Force -ErrorAction SilentlyContinue
Set-Alias cd z