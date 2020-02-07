#Simple script outputs a baseline of the 4 windows run keys to a file for review

$lm_run = "Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
$cu_run = "Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"
$lm_runonce = "Get-ItemProperty -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce"
$cu_runonce = "Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce"

$lm_info = "echo 'Local Machine Run Contents'"
$cu_info = "echo 'Current User Run Contents'"
$lm_runonceinfo = "echo 'LM Run Once Contents'"
$cu_runonceinfo = "echo 'CU Run Once Contents'"
Write-Output $lm_run

$a = $lm_info, $lm_run, $cu_info, $cu_run, $lm_runonceinfo, $lm_runonce, $cu_runonceinfo, $cu_runonce

echo ""
foreach ($element in $a) {
  #writes baseline of these folders to the screen
  Invoke-Expression $element
  
  $baseline = Invoke-Expression $element
  #writes baselinle of these folders to a file
  Out-File -FilePath runbaseline.txt -InputObject $baseline -Append
}