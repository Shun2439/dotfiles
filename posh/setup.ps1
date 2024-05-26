param([string]$select)

if($select -eq "terminal"){
  Remove-Item C:\Users\$Env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
  New-Item -Type SymbolicLink C:\Users\$Env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Value $PWD\..\settings.json
  Write-Output Done!
}
elseif($select -match '^t.*l$'){ echo "⚠️ maybe 'terminal' ?" }
elseif($select -eq "posh"){
  Remove-Item C:\Users\$Env:USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
  New-Item -Type SymbolicLink C:\Users\$Env:USERNAME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Value $PWD\Microsoft.PowerShell_profile.ps1

  Remove-Item C:\Users\$Env:USERNAME\Documents\WindowsPowerShell\profile.ps1
  New-Item -Type SymbolicLink C:\Users\$Env:USERNAME\Documents\WindowsPowerShell\profile.ps1 -Value $PWD\profile.ps1
  Write-Output Done!
}
elseif($select -match '^p.*h$'){ echo "⚠️ maybe 'posh' ?" }
elseif($select -match '.*h.*p$' -or !$select){
  Write-Output "Usage:`v`tsetup.ps1 <`"help`" or `"terminal`" or `"posh`">"
}

