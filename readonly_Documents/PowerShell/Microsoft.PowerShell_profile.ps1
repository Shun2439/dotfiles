Invoke-Expression (&starship init powershell)

Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

function Get-ChildItem {
    eza --icons $args
}

Set-Alias -Name e -Value emacsclient

Set-PSReadLineOption -EditMode Emacs

function y {
    $tmp = (New-TemporaryFile).FullName
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

# IntelliShell
# $env:INTELLI_HOME = "C:\Users\$Env:USERNAME\AppData\Roaming\IntelliShell\Intelli-Shell\data" # Is it correct?
# $env:INTELLI_SEARCH_HOTKEY = 'Ctrl+Spacebar'
# $env:INTELLI_VARIABLE_HOTKEY = 'Ctrl+l'
# $env:INTELLI_BOOKMARK_HOTKEY = 'Ctrl+b'
# $env:INTELLI_FIX_HOTKEY = 'Ctrl+x'
# Set-Alias -Name 'is' -Value 'intelli-shell'
# intelli-shell.exe init powershell | Out-String | Invoke-Expression
