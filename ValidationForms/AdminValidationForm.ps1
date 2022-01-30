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
  .\AdminValidationForm.ps1 -Account $selectedAccount
#>

Param (
    [Parameter(Mandatory)]
    $Account
)

#Add all applicable Employee Type Codes here
#This should mirror the Admin forms, I commented out the ones I don't think will be on SIPR.
$Global:eTypeArray = New-Object System.Data.DataTable
[Void]$eTypeArray.Columns.Add('DisplayName', 'System.String')
[Void]$eTypeArray.Columns.Add('PCC', 'System.String')
[Void]$eTypeArray.Rows.Add('Active Duty Personnel','A')
[Void]$eTypeArray.Rows.Add('Presidential Appointee','B')
[Void]$eTypeArray.Rows.Add('DoD Civil Service Employee','C')
#[Void]$eTypeArray.Rows.Add('Disabled American Veteran','D')
[Void]$eTypeArray.Rows.Add('DoD Contract Employee','E')
#[Void]$eTypeArray.Rows.Add('Former Member','F')
#[Void]$eTypeArray.Rows.Add('Organizational Account','G')
#[Void]$eTypeArray.Rows.Add('Medal of Honor Recipient','H')
[Void]$eTypeArray.Rows.Add('Non-DoD Civil Service Employee','I')
[Void]$eTypeArray.Rows.Add('Academy Student','J')
[Void]$eTypeArray.Rows.Add('Non-appropriated funds','K')
#[Void]$eTypeArray.Rows.Add('Lighthouse Service','L')
[Void]$eTypeArray.Rows.Add('Non-Government Agency Personnel','M')
[Void]$eTypeArray.Rows.Add('National Guard Member','N')
[Void]$eTypeArray.Rows.Add('Non-Dod Contract Employee','O')
#[Void]$eTypeArray.Rows.Add('Dual Persona Test Accounts','P')
#[Void]$eTypeArray.Rows.Add('Grey Area Retiree','Q')
[Void]$eTypeArray.Rows.Add('Retired Military Member','R')
#[Void]$eTypeArray.Rows.Add('Resource Accounts','S')
[Void]$eTypeArray.Rows.Add('Foreign Military Member','T')
[Void]$eTypeArray.Rows.Add('Foreign National Employee','U')
[Void]$eTypeArray.Rows.Add('Reserve Member','V')
[Void]$eTypeArray.Rows.Add('Kiosk Account','X')
#[Void]$eTypeArray.Rows.Add('Multi-User Account','Y')
#[Void]$eTypeArray.Rows.Add('Administrative Account','Z')

$form_Load = {
    #Convert the employeeType to a friendly display name
    $CN=[string]$Account.Properties.cn
    $employeeTypeCode = $CN.Split('.') | Select-Object -Last 1 -Skip 1
    $friendlyEmployeeType = ($eTypeArray | Where-Object {$_.PCC -eq $employeeTypeCode}).DisplayName

    #Append all the information
	$displayNameLabel.Text += [string]$Account.Properties.displayname
    $employeeTypeLabel.Text += [string]$friendlyEmployeeType
    $EDIPILabel.Text += [string]$Account.Properties.employeeid
    $baseLabel.Text += [string]$Account.Properties.l
    $accountNameLabel.Text += [string]$Account.Properties.cn

    #Set the validation warning label. It doesn't seem to be happy to store this in the other file.
    $validationWarningLabel.Text = @'
By submitting this type of request, you (IAO) are affirming:
    • the user has the necessary paperwork (ie DD2875, AF4394, etc) on file to be on the AFIN.
    • the account is required for the success of your organization's mission.
    • the account is being used solely by the individual identified in the account name.
    • face to face validation.
    • the EDIPI on the account matches the User's CAC.
'@
}

#Show GUI
. (Join-Path $PSScriptRoot 'AdminValidationForm.designer.ps1')
$AdminValidationForm.ShowDialog()