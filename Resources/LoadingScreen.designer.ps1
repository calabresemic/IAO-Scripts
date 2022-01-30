[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$script:LoadingScreen = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$label1 = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$label1 = (New-Object -TypeName System.Windows.Forms.Label)
$LoadingScreen.SuspendLayout()
#
#label1
#
$label1.Dock = [System.Windows.Forms.DockStyle]::Fill
$label1.ImageAlign = [System.Drawing.ContentAlignment]::MiddleRight
$label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$label1.Name = [System.String]'label1'
$label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]400,[System.Int32]150))
$label1.TabIndex = [System.Int32]0
$label1.Text = [System.String]'IAO Forms are loading
Please Wait...'
$label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$label1.UseWaitCursor = $true
#
#LoadingScreen
#
$LoadingScreen.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]79)),([System.Int32]([System.Byte][System.Byte]93)),([System.Int32]([System.Byte][System.Byte]117)))

$LoadingScreen.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Zoom
$LoadingScreen.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]400,[System.Int32]150))
$LoadingScreen.Controls.Add($label1)
$LoadingScreen.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]14))
$LoadingScreen.ForeColor = [System.Drawing.Color]::White
$LoadingScreen.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$LoadingScreen.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$LoadingScreen.Name = [System.String]'LoadingScreen'
$LoadingScreen.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$LoadingScreen.UseWaitCursor = $true
$LoadingScreen.ResumeLayout($false)
Add-Member -InputObject $LoadingScreen -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $LoadingScreen -Name label1 -Value $label1 -MemberType NoteProperty
Add-Member -InputObject $LoadingScreen -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent