Invoke-Expression (&starship init powershell)

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
