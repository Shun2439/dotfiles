Invoke-Expression (&starship init powershell)

function Start-Emacs {
    & "C:\soft\Emacs\emacs-28.2\bin\emacs.exe" -nw $args
}

Set-Alias em Start-Emacs
