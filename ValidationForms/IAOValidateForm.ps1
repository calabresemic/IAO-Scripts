#requires -version 5
<#
.SYNOPSIS
  Form will allow IAOs to validate service and admin accounts.
.DESCRIPTION
  Form will show the user either admin or service accounts to
  allow them to validate them.
  Must be originally run from IAO-Scripts.ps1
.INPUTS
  Selection of either admin or service account
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         Michael Calabrese
  Creation Date:  1/18/2022
  Purpose/Change: Initial script development
  
.EXAMPLE
  When called by IAOLauncher.ps1
  .\IAOValidateForm.ps1 -AccountType Admin
.EXAMPLE
  When called by IAOLauncher.ps1
  .\IAOValidateForm.ps1 -AccountType Service
#>

Param (
    [Parameter(Mandatory)]
    [String]
    [ValidateSet('Admin','Service')]
    $AccountType
)

#region Functions
Function Get-ADSIUser {
    #This funtion returns a list of user objects to display in the DataGridView
    Param (
        [Parameter(Mandatory)]
        [string]$SearchRoot,

        [Parameter(Mandatory)]
        [string[]]$propertiesToLoad,

        [Parameter()]
        [string]$AdditionalFilter
    )

    #Handle passing a filter.
    if($AdditionalFilter) {
        $filter = "(&(objectCategory=User)(anr=$AdditionalFilter))"
    } else {
        $filter = "(objectCategory=User)"
    }

    #Build the searcher
    $searcher = New-Object adsisearcher -Property @{
        Filter = $filter
        SearchRoot = $SearchRoot
        PageSize = 500
    }

    #Dynamically add the properties and create the formatting for the select-object.
    #This results in the function returning almost like the Get-AD Cmdlets
    foreach($property in $propertiesToLoad.ToLower()) {
        [void]$searcher.PropertiesToLoad.Add($property)
        [array]$returnformatting += @{ n=$property;e=([ScriptBlock]::Create("`$_.properties[`"$property`"][0]")) }
    }

    return $searcher.FindAll() | Select-Object -Property $returnformatting
}

Function Initialize-DataGridView {
    #This function loads the DataGridView with user objects
    Param (
        [Parameter(Mandatory)]
        $DataGridView,

        [Parameter()]
        [string]$AdditionalFilter
    )
    
    #Basic error logging
	trap {
		Write-Log -Message ($_ | Out-String) -Component $AccountType -Type Error -LogName IAOValidateForm
	}
    
    $IAOValidateForm.Cursor = 'WaitCursor' #Display the WaitCursor while the form loads
    $DataGridView.Rows.Clear() #Clear the current data in the rows

    #Handle changing searchbase
    if($AccountType -eq 'Admin') {
        $searchbase = "LDAP://OU=$userLocation,OU=Administrative Accounts,OU=Administration,$domainDN"
    } else {
        $searchbase = "LDAP://OU=$userLocation,OU=Service Accounts,OU=Administration,$domainDN"
    }

    #Handle passing filter
    if($AdditionalFilter) {
        Get-ADSIUser -SearchRoot $searchbase -propertiesToLoad name,extensionattribute7 -AdditionalFilter $AdditionalFilter | ForEach-Object {
            $DataGridView.Rows.Add([string]$_.name, [string]$_.extensionattribute7, 'Validate')
        }
    } else {
        Get-ADSIUser -SearchRoot $searchbase -propertiesToLoad name,extensionattribute7 | ForEach-Object {
            $DataGridView.Rows.Add([string]$_.name, [string]$_.extensionattribute7, 'Validate')
        }
    }
    $IAOValidateForm.Cursor = 'Default' #Return to default cursor when finished
}

Function Show-ValidationPrompt {
    #This function handles displaying the validation confirmation windows
    Param (
        [Parameter(Mandatory)]
        [String]$AccountType
    )

    Switch($AccountType) {
        'Admin' {
            . (Join-Path $PSScriptRoot 'AdminValidationForm.ps1') -Account $selectedAccount
        }
        'Service' {
            . (Join-Path $PSScriptRoot 'SVCValidationForm.ps1') -Account $selectedAccount
        }
    }
}

Function Update-DataGridView {
    #This function handles updating the DataGridView when searching
    if([string]::IsNullOrWhiteSpace($filterTextBox.Text)) {
        Initialize-DataGridView -DataGridView $validationDataGridView
    } else {
        Initialize-DataGridView -DataGridView $validationDataGridView -AdditionalFilter $filterTextBox.Text
    }
}
#endregion Functions


#This event is triggered when the form loads
$form_Load = {
    Initialize-DataGridView -DataGridView $validationDataGridView
}

#This event is triggered when the ValidationDataGridView is clicked
$validationDataGridView_CellContentClick = {
    if ($_.RowIndex -ge 0 -and $_.ColumnIndex -eq 2) {
		$AccountCN = $validationDataGridView[0, $_.RowIndex].Value #If clicking on the validate button grab the cn
        $selectedAccount = ([adsisearcher]"cn=$AccountCN" ).FindOne() #Search for the account based on cn
        $result = Show-ValidationPrompt -AccountType $AccountType #Show the validation window

        #If user validates account, do this
        if($result -eq "Yes") {
            try {
                [string]$validationStatement = "Acct Validated $(Get-Date -format "yyyyMMdd") by $($formUser.Properties.cn)"
                $AccountUpdate = $selectedAccount.GetDirectoryEntry() #Get the directoryentry for the account
                $AccountUpdate.ExtensionAttribute7 = $validationStatement #Update the validation statement
                $AccountUpdate.CommitChanges() #Save the changes to AD
                Update-DataGridView #Update the DataGridView again
            } catch [System.Management.Automation.MethodInvocationException] {
                if($_.Exception -match 'Access is Denied') {
                    [System.Windows.Forms.MessageBox]::Show('Access Denied when attempting to modify account','Error Occured!','OK','Error')
                }
            } catch {
                [System.Windows.Forms.MessageBox]::Show('The following error occured when attempting to modify account:' + 
                    [System.Environment]::NewLine + $_.Exception.Message,'Error Occured!','OK','Error')
            }
        }
	}
}

#This event is triggered when pressing enter in the filter textbox
$filterTextBox_KeyDown = {
    if($_.KeyCode -eq 'Return') {
        Update-DataGridView
        $_.Handled = $true
    }
}

#This event is triggered when clicking the search button
$searchButton_Click = {
    Update-DataGridView
}

#Show GUI
. (Join-Path $PSScriptRoot 'IAOValidateForm.designer.ps1')
$IAOValidateForm.ShowDialog()