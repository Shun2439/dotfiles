Invoke-Expression (&starship init powershell)

# Set-Alias -Name eza -Value "eza --icons" "not worked"
Set-Alias -Name ls -Value eza

Set-Alias -Name e -Value emacsclient

Set-PSReadLineOption -EditMode Emacs
