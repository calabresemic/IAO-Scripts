#requires -version 5
<#
.SYNOPSIS
  Form used to allow base admins to launch other forms.
.DESCRIPTION
  Form will load group membership and display appropriate menu items.
  Must be originally run from IAO-Scripts.ps1
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         Michael Calabrese
  Creation Date:  1/18/2022
  Purpose/Change: Initial script development
  
.EXAMPLE
  When called by IAO-Scripts.ps1
  .\IAOLauncher.ps1
#>

#Event triggered when form loads
$form_Load = {
	$basePermNames=@() #Generate an array to hold results of regex matching
    #Loop through the group membership and find all the bases user has permissions over
    $formUserMembership | % {
        if($_.Name -match '^GLS_([a-zA-Z0-9_ ]+)_IAO_AdminVerification$') {
            $basePermNames+=$Matches[1]
        }
    }

	#Grab only the unique names, accounts for multiple groups from the same base
	[array]$basePerms = foreach($name in ($basePermNames | Select-Object -Unique)) {
		$baseNames.Name | Where-Object {$_ -like "$name*"}
	}

    #Show base selector when member of multiple base groups
	if($basePerms.count -gt 1) {
		$baseSelectorCombobox.Items.AddRange($basePerms)
        $baseSelectorCombobox.SelectedIndex=0
		$baseSelectorCombobox.Visible = $true
	} else {
		$Global:userLocation = [string]$basePerms
	}
}

#Event triggered, if combobox is displayed (member of multiple base groups), when different base is selected
$baseSelectorCombobox_SelectedIndexChanged = {
	$Global:userLocation = $baseSelectorCombobox.Text
}

$validateAdminButton_Click = {
	. (Join-Path $validationFormsFolder 'IAOValidateForm.ps1') -AccountType Admin
}

$validateServiceButton_Click = {
	. (Join-Path $validationFormsFolder 'IAOValidateForm.ps1') -AccountType Service
}

$showHelpButton_Click = {
	. (Join-Path $resourcesFolder 'ShowHelp.txt')
}

#Launch GUI
. (Join-Path $PSScriptRoot 'IAOLauncher.designer.ps1')
$IAOLauncher.ShowDialog()