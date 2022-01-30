[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$SVCValidationForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$baseLabel = $null
[System.Windows.Forms.Label]$accountNameLabel = $null
[System.Windows.Forms.Button]$validationButton = $null
[System.Windows.Forms.Label]$validationWarningLabel = $null
[System.Windows.Forms.Label]$descriptionLabel = $null
[System.Windows.Forms.Label]$orgLabel = $null
[System.Windows.Forms.Label]$officeLabel = $null
[System.Windows.Forms.Label]$emailLabel = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$baseLabel = (New-Object -TypeName System.Windows.Forms.Label)
$accountNameLabel = (New-Object -TypeName System.Windows.Forms.Label)
$validationWarningLabel = (New-Object -TypeName System.Windows.Forms.Label)
$validationButton = (New-Object -TypeName System.Windows.Forms.Button)
$descriptionLabel = (New-Object -TypeName System.Windows.Forms.Label)
$orgLabel = (New-Object -TypeName System.Windows.Forms.Label)
$officeLabel = (New-Object -TypeName System.Windows.Forms.Label)
$emailLabel = (New-Object -TypeName System.Windows.Forms.Label)
$SVCValidationForm.SuspendLayout()
#
#baseLabel
#
$baseLabel.AutoSize = $true
$baseLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$baseLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]35))
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
$accountNameLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]10))
$accountNameLabel.Name = [System.String]'accountNameLabel'
$accountNameLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$accountNameLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]122,[System.Int32]25))
$accountNameLabel.TabIndex = [System.Int32]5
$accountNameLabel.Text = [System.String]'Account Name: '
#
#validationWarningLabel
#
$validationWarningLabel.AutoSize = $true
$validationWarningLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$validationWarningLabel.ForeColor = [System.Drawing.Color]::Red
$validationWarningLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]160))
$validationWarningLabel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]3))
$validationWarningLabel.Name = [System.String]'validationWarningLabel'
$validationWarningLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]10))
$validationWarningLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]126,[System.Int32]30))
$validationWarningLabel.TabIndex = [System.Int32]6
$validationWarningLabel.Text = [System.String]'Placeholder Text'
#
#validationButton
#
$validationButton.AutoSize = $true
$validationButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
$validationButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Popup
$validationButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]225,[System.Int32]290))
$validationButton.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]250,[System.Int32]0))
$validationButton.Name = [System.String]'validationButton'
$validationButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]250,[System.Int32]30))
$validationButton.TabIndex = [System.Int32]7
$validationButton.Text = [System.String]'Submit Validate Request'
$validationButton.UseVisualStyleBackColor = $true
#
#descriptionLabel
#
$descriptionLabel.AutoSize = $true
$descriptionLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$descriptionLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]135))
$descriptionLabel.Name = [System.String]'descriptionLabel'
$descriptionLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$descriptionLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]97,[System.Int32]25))
$descriptionLabel.TabIndex = [System.Int32]8
$descriptionLabel.Text = [System.String]'Description: '
#
#orgLabel
#
$orgLabel.AutoSize = $true
$orgLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$orgLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]60))
$orgLabel.Name = [System.String]'orgLabel'
$orgLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$orgLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]107,[System.Int32]25))
$orgLabel.TabIndex = [System.Int32]9
$orgLabel.Text = [System.String]'Organization: '
#
#officeLabel
#
$officeLabel.AutoSize = $true
$officeLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$officeLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]85))
$officeLabel.Name = [System.String]'officeLabel'
$officeLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$officeLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]59,[System.Int32]25))
$officeLabel.TabIndex = [System.Int32]10
$officeLabel.Text = [System.String]'Office: '
#
#emailLabel
#
$emailLabel.AutoSize = $true
$emailLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$emailLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]110))
$emailLabel.Name = [System.String]'emailLabel'
$emailLabel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0,[System.Int32]0,[System.Int32]0,[System.Int32]5))
$emailLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]56,[System.Int32]25))
$emailLabel.TabIndex = [System.Int32]11
$emailLabel.Text = [System.String]'Email: '
#
#SVCValidationForm
#
$SVCValidationForm.AutoSize = $true
$SVCValidationForm.BackColor = [System.Drawing.Color]::White
$SVCValidationForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]721,[System.Int32]341))
$SVCValidationForm.Controls.Add($validationButton)
$SVCValidationForm.Controls.Add($validationWarningLabel)
$SVCValidationForm.Controls.Add($descriptionLabel)
$SVCValidationForm.Controls.Add($emailLabel)
$SVCValidationForm.Controls.Add($officeLabel)
$SVCValidationForm.Controls.Add($orgLabel)
$SVCValidationForm.Controls.Add($baseLabel)
$SVCValidationForm.Controls.Add($accountNameLabel)
$SVCValidationForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$SVCValidationForm.ForeColor = [System.Drawing.Color]::Black
$SVCValidationForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$SVCValidationForm.MaximizeBox = $false
$SVCValidationForm.MinimizeBox = $false
$SVCValidationForm.Name = [System.String]'SVCValidationForm'
$SVCValidationForm.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]10))
$SVCValidationForm.ShowIcon = $false
$SVCValidationForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$SVCValidationForm.TopMost = $true
$SVCValidationForm.add_Load($form_Load)
$SVCValidationForm.ResumeLayout($false)
$SVCValidationForm.PerformLayout()
Add-Member -InputObject $SVCValidationForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name baseLabel -Value $baseLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name accountNameLabel -Value $accountNameLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name validationButton -Value $validationButton -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name validationWarningLabel -Value $validationWarningLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name descriptionLabel -Value $descriptionLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name orgLabel -Value $orgLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name officeLabel -Value $officeLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name emailLabel -Value $emailLabel -MemberType NoteProperty
Add-Member -InputObject $SVCValidationForm -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
