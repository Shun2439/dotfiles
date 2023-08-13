[string]$select = Read-Host "What do I set up?"

If($select -eq "neovim")
{
    copy-item ../nvim/init.vim ~/AppData/Local/nvim/init.vim
    Write-Host "completed!"
}
Else
{
    Write-Host "See you"
}
