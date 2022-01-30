[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$AdminValidationForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$displayNameLabel = $null
[System.Windows.Forms.Label]$employeeTypeLabel = $null
[System.Windows.Forms.Label]$EDIPILabel = $null
[System.Windows.Forms.Label]$baseLabel = $null
[System.Windows.Forms.Label]$accountNameLabel = $null
[System.Windows.Forms.Button]$validationButton = $null
[System.Windows.Forms.Label]$validationWarningLabel = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$displayNameLabel = (New-Object -TypeName System.Windows.Forms.Label)
$employeeTypeLabel = (New-Object -TypeName System.Windows.Forms.Label)
$EDIPILabel = (New-Object -TypeName System.Windows.Forms.Label)
$baseLabel = (New-Object -TypeName System.Windows.Forms.Label)
$accountNameLabel = (New-Object -TypeName System.Windows.Forms.Label)
$validationWarningLabel = (New-Object -TypeName System.Windows.Forms.Label)
$validationButton = (New-Object -TypeName System.Windows.Forms.Button)
$AdminValidationForm.SuspendLayout()
#
#displayNameLabel
#
$displayNameLabel.AutoSize = $true
$displayNameLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$displayNameLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]10))
$displayNameLabel.Name = [System.String]'displayNameLabel'
$displayNameLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$displayNameLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]114,[System.Int32]25))
$displayNameLabel.TabIndex = [System.Int32]0
$displayNameLabel.Text = [System.String]'Display Name: '
#
#employeeTypeLabel
#
$employeeTypeLabel.AutoSize = $true
$employeeTypeLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$employeeTypeLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]35))
$employeeTypeLabel.Name = [System.String]'employeeTypeLabel'
$employeeTypeLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$employeeTypeLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]125,[System.Int32]25))
$employeeTypeLabel.TabIndex = [System.Int32]1
$employeeTypeLabel.Text = [System.String]'Employee Type: '
#
#EDIPILabel
#
$EDIPILabel.AutoSize = $true
$EDIPILabel.Dock = [System.Windows.Forms.DockStyle]::Top
$EDIPILabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]60))
$EDIPILabel.Name = [System.String]'EDIPILabel'
$EDIPILabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$EDIPILabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]60,[System.Int32]25))
$EDIPILabel.TabIndex = [System.Int32]2
$EDIPILabel.Text = [System.String]'EDIPI: '
#
#baseLabel
#
$baseLabel.AutoSize = $true
$baseLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$baseLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]85))
$baseLabel.Name = [System.String]'baseLabel'
$baseLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$baseLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]54,[System.Int32]25))
$baseLabel.TabIndex = [System.Int32]3
$baseLabel.Text = [System.String]'Base: '
#
#accountNameLabel
#
$accountNameLabel.AutoSize = $true
$accountNameLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$accountNameLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]110))
$accountNameLabel.Name = [System.String]'accountNameLabel'
$accountNameLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$accountNameLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]118,[System.Int32]25))
$accountNameLabel.TabIndex = [System.Int32]5
$accountNameLabel.Text = [System.String]'Account Name:'
#
#validationWarningLabel
#
$validationWarningLabel.AutoSize = $true
$validationWarningLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$validationWarningLabel.ForeColor = [System.Drawing.Color]::Red
$validationWarningLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]135))
$validationWarningLabel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
$validationWarningLabel.Name = [System.String]'validationWarningLabel'
$validationWarningLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]10))
$validationWarningLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]121,[System.Int32]30))
$validationWarningLabel.TabIndex = [System.Int32]6
$validationWarningLabel.Text = [System.String]'placeholder text'
#
#validationButton
#
$validationButton.AutoSize = $true
$validationButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
$validationButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Popup
$validationButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]235,[System.Int32]280))
$validationButton.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]250,[System.Int32]0))
$validationButton.Name = [System.String]'validationButton'
$validationButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]250,[System.Int32]30))
$validationButton.TabIndex = [System.Int32]7
$validationButton.Text = [System.String]'Submit Validate Request'
$validationButton.UseVisualStyleBackColor = $true
#
#AdminValidationForm
#
$AdminValidationForm.AutoSize = $true
$AdminValidationForm.BackColor = [System.Drawing.Color]::White
$AdminValidationForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]721,[System.Int32]328))
$AdminValidationForm.Controls.Add($validationButton)
$AdminValidationForm.Controls.Add($validationWarningLabel)
$AdminValidationForm.Controls.Add($accountNameLabel)
$AdminValidationForm.Controls.Add($baseLabel)
$AdminValidationForm.Controls.Add($EDIPILabel)
$AdminValidationForm.Controls.Add($employeeTypeLabel)
$AdminValidationForm.Controls.Add($displayNameLabel)
$AdminValidationForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$AdminValidationForm.ForeColor = [System.Drawing.Color]::Black
$AdminValidationForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$AdminValidationForm.MaximizeBox = $false
$AdminValidationForm.MinimizeBox = $false
$AdminValidationForm.Name = [System.String]'AdminValidationForm'
$AdminValidationForm.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$AdminValidationForm.ShowIcon = $false
$AdminValidationForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$AdminValidationForm.Text = [System.String]'Admin Validation Form'
$AdminValidationForm.TopMost = $true
$AdminValidationForm.add_Load($form_Load)
$AdminValidationForm.ResumeLayout($false)
$AdminValidationForm.PerformLayout()
Add-Member -InputObject $AdminValidationForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name displayNameLabel -Value $displayNameLabel -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name employeeTypeLabel -Value $employeeTypeLabel -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name EDIPILabel -Value $EDIPILabel -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name baseLabel -Value $baseLabel -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name accountNameLabel -Value $accountNameLabel -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name validationButton -Value $validationButton -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name validationWarningLabel -Value $validationWarningLabel -MemberType NoteProperty
Add-Member -InputObject $AdminValidationForm -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
