[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$IAOLauncher = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.FlowLayoutPanel]$flowLayoutPanel1 = $null
[System.Windows.Forms.Label]$label1 = $null
[System.Windows.Forms.ComboBox]$baseSelectorCombobox = $null
[System.Windows.Forms.Button]$validateAdminButton = $null
[System.Windows.Forms.Button]$validateServiceButton = $null
[System.Windows.Forms.Button]$showHelpButton = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$flowLayoutPanel1 = (New-Object -TypeName System.Windows.Forms.FlowLayoutPanel)
$label1 = (New-Object -TypeName System.Windows.Forms.Label)
$baseSelectorCombobox = (New-Object -TypeName System.Windows.Forms.ComboBox)
$validateAdminButton = (New-Object -TypeName System.Windows.Forms.Button)
$validateServiceButton = (New-Object -TypeName System.Windows.Forms.Button)
$showHelpButton = (New-Object -TypeName System.Windows.Forms.Button)
$flowLayoutPanel1.SuspendLayout()
$IAOLauncher.SuspendLayout()
#
#flowLayoutPanel1
#
$flowLayoutPanel1.AutoSize = $true
$flowLayoutPanel1.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$flowLayoutPanel1.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]79)),([System.Int32]([System.Byte][System.Byte]93)),([System.Int32]([System.Byte][System.Byte]117)))

$flowLayoutPanel1.Controls.Add($label1)
$flowLayoutPanel1.Controls.Add($baseSelectorCombobox)
$flowLayoutPanel1.Controls.Add($validateAdminButton)
$flowLayoutPanel1.Controls.Add($validateServiceButton)
$flowLayoutPanel1.Controls.Add($showHelpButton)
$flowLayoutPanel1.Dock = [System.Windows.Forms.DockStyle]::Fill
$flowLayoutPanel1.FlowDirection = [System.Windows.Forms.FlowDirection]::TopDown
$flowLayoutPanel1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$flowLayoutPanel1.ForeColor = [System.Drawing.Color]::White
$flowLayoutPanel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$flowLayoutPanel1.Name = [System.String]'flowLayoutPanel1'
$flowLayoutPanel1.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]7))
$flowLayoutPanel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]365,[System.Int32]273))
$flowLayoutPanel1.TabIndex = [System.Int32]0
#
#label1
#
$label1.AutoSize = $true
$label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]7))
$label1.Name = [System.String]'label1'
$label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]329,[System.Int32]24))
$label1.TabIndex = [System.Int32]0
$label1.Text = [System.String]'Press a button below to launch a form.'
#
#baseSelectorCombobox
#
$baseSelectorCombobox.Dock = [System.Windows.Forms.DockStyle]::Top
$baseSelectorCombobox.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$baseSelectorCombobox.FlatStyle = [System.Windows.Forms.FlatStyle]::Popup
$baseSelectorCombobox.FormattingEnabled = $true
$baseSelectorCombobox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]34))
$baseSelectorCombobox.Name = [System.String]'baseSelectorCombobox'
$baseSelectorCombobox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]329,[System.Int32]32))
$baseSelectorCombobox.TabIndex = [System.Int32]9
$baseSelectorCombobox.Visible = $false
$baseSelectorCombobox.add_SelectedIndexChanged($baseSelectorCombobox_SelectedIndexChanged)
#
#validateAdminButton
#
$validateAdminButton.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]239)),([System.Int32]([System.Byte][System.Byte]131)),([System.Int32]([System.Byte][System.Byte]84)))

$validateAdminButton.Dock = [System.Windows.Forms.DockStyle]::Top
$validateAdminButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Popup
$validateAdminButton.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$validateAdminButton.ForeColor = [System.Drawing.Color]::Black
$validateAdminButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]72))
$validateAdminButton.Name = [System.String]'validateAdminButton'
$validateAdminButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]329,[System.Int32]50))
$validateAdminButton.TabIndex = [System.Int32]10
$validateAdminButton.Text = [System.String]'Validate Admin Account'
$validateAdminButton.UseVisualStyleBackColor = $false
$validateAdminButton.add_Click($validateAdminButton_Click)
#
#validateServiceButton
#
$validateServiceButton.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]239)),([System.Int32]([System.Byte][System.Byte]131)),([System.Int32]([System.Byte][System.Byte]84)))

$validateServiceButton.Dock = [System.Windows.Forms.DockStyle]::Top
$validateServiceButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Popup
$validateServiceButton.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$validateServiceButton.ForeColor = [System.Drawing.Color]::Black
$validateServiceButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]128))
$validateServiceButton.Name = [System.String]'validateServiceButton'
$validateServiceButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]329,[System.Int32]50))
$validateServiceButton.TabIndex = [System.Int32]11
$validateServiceButton.Text = [System.String]'Validate Service Account'
$validateServiceButton.UseVisualStyleBackColor = $false
$validateServiceButton.add_Click($validateServiceButton_Click)
#
#showHelpButton
#
$showHelpButton.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]239)),([System.Int32]([System.Byte][System.Byte]131)),([System.Int32]([System.Byte][System.Byte]84)))

$showHelpButton.Dock = [System.Windows.Forms.DockStyle]::Top
$showHelpButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Popup
$showHelpButton.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$showHelpButton.ForeColor = [System.Drawing.Color]::Black
$showHelpButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]10,[System.Int32]184))
$showHelpButton.Name = [System.String]'showHelpButton'
$showHelpButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]329,[System.Int32]50))
$showHelpButton.TabIndex = [System.Int32]12
$showHelpButton.Text = [System.String]'Show Help'
$showHelpButton.UseVisualStyleBackColor = $false
$showHelpButton.add_Click($showHelpButton_Click)
#
#IAOLauncher
#
$IAOLauncher.AutoSize = $true
$IAOLauncher.AutoSizeMode = [System.Windows.Forms.AutoSizeMode]::GrowAndShrink
$IAOLauncher.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]365,[System.Int32]273))
$IAOLauncher.Controls.Add($flowLayoutPanel1)
$IAOLauncher.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$IAOLauncher.Name = [System.String]'IAOLauncher'
$IAOLauncher.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$IAOLauncher.Text = [System.String]'IAO Launcher v1.0'
$IAOLauncher.add_Load($form_Load)
$flowLayoutPanel1.ResumeLayout($false)
$flowLayoutPanel1.PerformLayout()
$IAOLauncher.ResumeLayout($false)
$IAOLauncher.PerformLayout()
Add-Member -InputObject $IAOLauncher -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name flowLayoutPanel1 -Value $flowLayoutPanel1 -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name label1 -Value $label1 -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name baseSelectorCombobox -Value $baseSelectorCombobox -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name validateAdminButton -Value $validateAdminButton -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name validateServiceButton -Value $validateServiceButton -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name showHelpButton -Value $showHelpButton -MemberType NoteProperty
Add-Member -InputObject $IAOLauncher -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
