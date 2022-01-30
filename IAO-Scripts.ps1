#requires -version 5
<#
.SYNOPSIS
  Script for IA Validation of Admin and Service Accounts.
.DESCRIPTION
  This script will load all of the group memberships an IAO has and allow them to validate accounts at each base.
  I'm building this like the Admin-Scripts in case we ever need to expand the delegation.
.PARAMETER Beta
    Switch to launch the beta version of the scripts. Changes the file path for a couple things.
.INPUTS
  None
.OUTPUTS
  Log file stored in %LocalAppData%\IAO-Scripts.log
.NOTES
  Version:        1.0
  Author:         Michael Calabrese
  Creation Date:  1/27/2022
  Purpose/Change: Initial script development
  ToDo List: 
    - 
  
.EXAMPLE
  Shortcut for production scripts
  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden -File C:\IAO-Scripts\IAO-Scripts.ps1

.EXAMPLE
  Shortcut for beta testing, note that the window is not hidden on beta shortcuts
  C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -File C:\BetaIAO_Scripts\IAO-Scripts.ps1 Beta
#>

Param (
    [Switch]$Beta
)

#region Functions
Function Check-ScriptHash {
    #Retool of the old way of updating admin scripts. Only used for this script.
    #Updates and relaunches script only if changes were made to the domain copy.
    Param(
        [Switch]$Beta
    )

    $ScriptName = (Split-Path $PSCommandPath -Leaf)
    $hashDest = Get-FileHash $PSCommandPath -Algorithm "SHA256"
    if($Beta){
        $hashSrc = Get-FileHash "$env:LOGONSERVER\netlogon\IAO_Scripts\BetaIAO_Scripts\$ScriptName" -Algorithm "SHA256"
        if ($hashSrc.Hash -ne $hashDest.Hash) {
            Write-Warning "Your script is not up to date! Updating Now..."
            robocopy.exe "$env:LOGONSERVER\netlogon\IAO_Scripts\Beta" "$env:SystemDrive\BetaIAO_Scripts" $ScriptName | Out-Null
            $CommandLine = "-File `"" + $PSCommandPath + "`" "
            Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
            Exit
        }
    } else {
        $hashSrc = Get-FileHash "$env:LOGONSERVER\netlogon\IAO_Scripts\$ScriptName" -Algorithm "SHA256"
        if ($hashSrc.Hash -ne $hashDest.Hash) {
            robocopy.exe "$env:LOGONSERVER\netlogon\IAO_Scripts" "$env:SystemDrive\IAO_Scripts" $ScriptName | Out-Null
            $CommandLine = "-WindowStyle Hidden -File `"" + $PSCommandPath + "`" "
            Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
            Exit
        }
    }
}

Function Get-BaseNames {
    #Grabs the OUs under the Bases OU and returns name and DN.

    #Build the ADSIsearcher
    $searcher = New-Object adsisearcher -Property @{
        Filter = "(objectCategory=OrganizationalUnit)"
        SearchRoot = "LDAP://OU=Bases,$domainDN"
        SearchScope = "Onelevel"
        PageSize = 500
    }
    [void]$searcher.PropertiesToLoad.Add("name")
    [void]$searcher.PropertiesToLoad.Add("distinguishedname")

    #Format the return results
    return $searcher.FindAll() | Select-Object `
        @{n='Name';e={$_.properties['name'][0]}},
        @{n='DistinguishedName';e={$_.properties['distinguishedname'][0]}}
}

Function Get-UserNestedGroups {
    #Searches AD (via ADSI) for the user's nested groups.
    param (
        [Parameter(Mandatory)]
        [string]$UserDN,

        [Parameter(Mandatory)]
        [string[]]$propertiesToLoad
    )
    
    #Build the adsisearcher
    $searcher = New-Object adsisearcher -Property @{
        Filter = "(&(objectCategory=group)(member:1.2.840.113556.1.4.1941:=$userDN))"
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

Function Update-IAOScripts {
    #Mirrors any file that matches the ScriptName param.
    #Useful for updating both the Form.ps1 and the Form.designer.ps1 file along with any other misc files.
    Param(      
        [Switch]$Beta
    )

    if($Beta){
        Write-Host "Syncing Forms with the domain master copy"
        robocopy.exe "$env:LOGONSERVER\netlogon\IAO_Scripts\Beta_Scripts" "$env:SystemDrive\BetaIAO_Scripts" /MIR
    } else {
        robocopy.exe "$env:LOGONSERVER\netlogon\IAO_Scripts" "$env:SystemDrive\IAO_Scripts" /MIR
    }
}

Function Global:Write-Log {
    #Logs in CMTrace format. Creates folder in LocalAppData to store errors for the forms.
    #Currently using in conjunction with ($_ | Out-String) in catch blocks
    Param(
        [Parameter(Mandatory)]
        [String]$Message,

        [String]$Component,

        [Parameter(Mandatory)]
        [ValidateSet("Info","Warning","Error")]
        [String]$Type = "Info",

        [Parameter(Mandatory)]
        [String]$LogName
    )
    
    #If APPDATA\Local\Admin-Scripts folder does not exist, create it
    if(!(Test-Path "$env:LOCALAPPDATA\IAO-Scripts")){
        New-Item "$env:LOCALAPPDATA\IAO-Scripts" -ItemType Directory
    }

    #Convert string for type to required format
    Switch ($Type) {
        "Info"      {[int]$Type = 1}
        "Warning"   {[int]$Type = 2}
        "Error"     {[int]$Type = 3}
    }

    #Format the log entry
    $Content = "<![LOG[$Message]LOG]!>" +`
        "<time=`"$(Get-Date -Format "HH:mm:ss.ffffff")`" " +`
        "date=`"$(Get-Date -Format "M-d-yyyy")`" " +`
        "component=`"$Component`" " +`
        "context=`"$([System.Security.Principal.WindowsIdentity]::GetCurrent().Name)`" " +`
        "type=`"$Type`" " +`
        "thread=`"$([Threading.Thread]::CurrentThread.ManagedThreadId)`" " +`
        "file=`"`">"

    #Write to file
    Add-Content -Path "$env:LOCALAPPDATA\IAO-Scripts\$LogName.log" -Value $Content
}
#endregion Functions

#Load Assemblies, only required because I wanted to make the resources globally available. 
#PS Pro Tools makes a resource file for each form and that's overkill for this.
[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')

#region Variables
$Global:domainDN = ([ADSI]"LDAP://RootDSE").defaultNamingContext
$Global:resourcesFolder = Join-Path $PSScriptRoot 'Resources'
$Global:launchersFolder = Join-Path $PSScriptRoot 'Launchers'
$Global:validationFormsFolder = Join-Path $PSScriptRoot 'ValidationForms'
$Global:resources = . (Join-Path $resourcesFolder 'IAOForms.resources.ps1')
#endregion Variables

#Import and show loading screen
. (Join-Path $resourcesFolder 'LoadingScreen.designer.ps1')
$loadingScreen.Show()

#This verifies that the script is up to date for the user before launching the rest of them
if($Beta) {
    Check-ScriptHash -Beta 
} else {
    Check-ScriptHash #This verifies that the script is up to date for the user before launching the rest of them
}

#Get user and domain info
$Global:formUser = ([adsisearcher]"samAccountName=$env:USERNAME").FindOne() #Get info on the user
$Global:formUserMembership = Get-UserNestedGroups -UserDN $formUser.Properties.distinguishedname -propertiesToLoad name #Get all users groups including nested ones
$Global:baseNames = Get-BaseNames #Gather Base Names from the 'Bases' OU

#This verifies that the script is up to date for the user before launching the rest of them
if($Beta) {
    Update-IAOScripts -Beta 
} else {
    Update-IAOScripts 
}

#Show IAOLauncher
$loadingScreen.Close()
. (Join-Path $launchersFolder 'IAOLauncher.ps1')
