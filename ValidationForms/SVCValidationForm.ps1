#requires -version 5
<#
.SYNOPSIS
  Form displays the account validation prompt.
.DESCRIPTION
  Form shows account information and warning from IAO Express.
  Must be originally run from IAO-Scripts.ps1
.INPUTS
  The results of an ADSI searcher.
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         Michael Calabrese
  Creation Date:  1/18/2022
  Purpose/Change: Initial script development
  
.EXAMPLE
  When called by IAOValidateForm.ps1
  .\SVCValidationForm.ps1 -Account $selectedAccount
#>

Param (
    [Parameter(Mandatory)]
    $Account
)

#Event triggered when the form loads
$form_Load = {
    #Append all the information
    $accountNameLabel.Text += [string]$Account.Properties.cn
    $baseLabel.Text += [string]$Account.Properties.l
    $orgLabel.Text += [string]$Account.Properties.o
    $officeLabel.Text += [string]$Account.Properties.physicaldeliveryofficename
    $emailLabel.Text += [string]$Account.Properties.extensionattribute13
    $descriptionLabel.Text += [string]$Account.properties.description

    #Set the validation warning label. It doesn't seem to be happy to store this in the other file.
    $validationWarningLabel.Text = @'
By submitting this type of request, you (IAO) are affirming:
    • the service account has the necessary paperwork on file to be on the AFIN.
    • the account is required for the success of your organization's mission.
    • the account is being used solely for the purpose identified in the account description.
'@
}

#Show GUI
. (Join-Path $PSScriptRoot 'SVCValidationForm.designer.ps1')
$SVCValidationForm.ShowDialog()