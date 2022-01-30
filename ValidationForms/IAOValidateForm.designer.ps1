[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$IAOValidateForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.TextBox]$filterTextBox = $null
[System.Windows.Forms.DataGridView]$validationDataGridView = $null
[System.Windows.Forms.FlowLayoutPanel]$flowLayoutPanel1 = $null
[System.Windows.Forms.Button]$searchButton = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$NameColumn = $null
[System.Windows.Forms.DataGridViewTextBoxColumn]$ValidationStatement = $null
[System.Windows.Forms.DataGridViewButtonColumn]$validateButtonColumn = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
[System.Windows.Forms.DataGridViewCellStyle]$dataGridViewCellStyle1 = (New-Object -TypeName System.Windows.Forms.DataGridViewCellStyle)
$validationDataGridView = (New-Object -TypeName System.Windows.Forms.DataGridView)
$filterTextBox = (New-Object -TypeName System.Windows.Forms.TextBox)
$flowLayoutPanel1 = (New-Object -TypeName System.Windows.Forms.FlowLayoutPanel)
$searchButton = (New-Object -TypeName System.Windows.Forms.Button)
$NameColumn = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$ValidationStatement = (New-Object -TypeName System.Windows.Forms.DataGridViewTextBoxColumn)
$validateButtonColumn = (New-Object -TypeName System.Windows.Forms.DataGridViewButtonColumn)
([System.ComponentModel.ISupportInitialize]$validationDataGridView).BeginInit()
$flowLayoutPanel1.SuspendLayout()
$IAOValidateForm.SuspendLayout()
#
#validationDataGridView
#
$validationDataGridView.AllowUserToAddRows = $false
$validationDataGridView.AllowUserToDeleteRows = $false
$validationDataGridView.AllowUserToResizeRows = $false
$validationDataGridView.AutoSizeColumnsMode = [System.Windows.Forms.DataGridViewAutoSizeColumnsMode]::Fill
$validationDataGridView.ColumnHeadersHeightSizeMode = [System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode]::AutoSize
$validationDataGridView.Columns.AddRange($NameColumn,$ValidationStatement,$validateButtonColumn)
$validationDataGridView.Dock = [System.Windows.Forms.DockStyle]::Fill
$validationDataGridView.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]36))
$validationDataGridView.Name = [System.String]'validationDataGridView'
$validationDataGridView.ReadOnly = $true
$validationDataGridView.RowHeadersVisible = $false
$validationDataGridView.RowHeadersWidth = [System.Int32]51
$validationDataGridView.RowTemplate.DefaultCellStyle.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$validationDataGridView.RowTemplate.DefaultCellStyle.ForeColor = [System.Drawing.Color]::Black
$validationDataGridView.RowTemplate.DefaultCellStyle.SelectionForeColor = [System.Drawing.Color]::Black
$validationDataGridView.SelectionMode = [System.Windows.Forms.DataGridViewSelectionMode]::FullRowSelect
$validationDataGridView.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]984,[System.Int32]525))
$validationDataGridView.TabIndex = [System.Int32]8
$validationDataGridView.add_CellContentClick($validationDataGridView_CellContentClick)
#
#filterTextBox
#
$filterTextBox.Dock = [System.Windows.Forms.DockStyle]::Top
$filterTextBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]8,[System.Int32]5))
$filterTextBox.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]500,[System.Int32]0))
$filterTextBox.Name = [System.String]'filterTextBox'
$filterTextBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]500,[System.Int32]26))
$filterTextBox.TabIndex = [System.Int32]10
$filterTextBox.add_KeyDown($filterTextBox_KeyDown)
#
#flowLayoutPanel1
#
$flowLayoutPanel1.AutoSize = $true
$flowLayoutPanel1.Controls.Add($filterTextBox)
$flowLayoutPanel1.Controls.Add($searchButton)
$flowLayoutPanel1.Dock = [System.Windows.Forms.DockStyle]::Top
$flowLayoutPanel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$flowLayoutPanel1.Name = [System.String]'flowLayoutPanel1'
$flowLayoutPanel1.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]5,[System.Int32]2,[System.Int32]20,[System.Int32]0))
$flowLayoutPanel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]984,[System.Int32]36))
$flowLayoutPanel1.TabIndex = [System.Int32]11
#
#searchButton
#
$searchButton.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]239)),([System.Int32]([System.Byte][System.Byte]131)),([System.Int32]([System.Byte][System.Byte]84)))

$searchButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$searchButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]514,[System.Int32]5))
$searchButton.Name = [System.String]'searchButton'
$searchButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]80,[System.Int32]28))
$searchButton.TabIndex = [System.Int32]11
$searchButton.Text = [System.String]'Search'
$searchButton.UseVisualStyleBackColor = $false
$searchButton.add_Click($searchButton_Click)
#
#NameColumn
#
$NameColumn.AutoSizeMode = [System.Windows.Forms.DataGridViewAutoSizeColumnMode]::AllCells
$NameColumn.HeaderText = [System.String]'Name'
$NameColumn.MinimumWidth = [System.Int32]6
$NameColumn.Name = [System.String]'NameColumn'
$NameColumn.ReadOnly = $true
$NameColumn.Width = [System.Int32]76
#
#ValidationStatement
#
$ValidationStatement.HeaderText = [System.String]'ValidationStatement'
$ValidationStatement.MinimumWidth = [System.Int32]6
$ValidationStatement.Name = [System.String]'ValidationStatement'
$ValidationStatement.ReadOnly = $true
#
#validateButtonColumn
#
$validateButtonColumn.AutoSizeMode = [System.Windows.Forms.DataGridViewAutoSizeColumnMode]::AllCellsExceptHeader
$dataGridViewCellStyle1.Alignment = [System.Windows.Forms.DataGridViewContentAlignment]::MiddleCenter
$dataGridViewCellStyle1.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]239)),([System.Int32]([System.Byte][System.Byte]131)),([System.Int32]([System.Byte][System.Byte]84)))

$dataGridViewCellStyle1.SelectionBackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]239)),([System.Int32]([System.Byte][System.Byte]131)),([System.Int32]([System.Byte][System.Byte]84)))

$dataGridViewCellStyle1.SelectionForeColor = [System.Drawing.Color]::Black
$validateButtonColumn.DefaultCellStyle = $dataGridViewCellStyle1
$validateButtonColumn.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$validateButtonColumn.HeaderText = [System.String]''
$validateButtonColumn.MinimumWidth = [System.Int32]6
$validateButtonColumn.Name = [System.String]'validateButtonColumn'
$validateButtonColumn.ReadOnly = $true
$validateButtonColumn.Width = [System.Int32]6
#
#IAOValidateForm
#
$IAOValidateForm.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]79)),([System.Int32]([System.Byte][System.Byte]93)),([System.Int32]([System.Byte][System.Byte]117)))

$IAOValidateForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]984,[System.Int32]561))
$IAOValidateForm.Controls.Add($validationDataGridView)
$IAOValidateForm.Controls.Add($flowLayoutPanel1)
$IAOValidateForm.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Microsoft Sans Serif',[System.Single]12))
$IAOValidateForm.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$IAOValidateForm.Name = [System.String]'IAOValidateForm'
$IAOValidateForm.Text = [System.String]'IA Validate Form v1.0'
$IAOValidateForm.add_Load($form_Load)
([System.ComponentModel.ISupportInitialize]$validationDataGridView).EndInit()
$flowLayoutPanel1.ResumeLayout($false)
$flowLayoutPanel1.PerformLayout()
$IAOValidateForm.ResumeLayout($false)
$IAOValidateForm.PerformLayout()
Add-Member -InputObject $IAOValidateForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name filterTextBox -Value $filterTextBox -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name validationDataGridView -Value $validationDataGridView -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name flowLayoutPanel1 -Value $flowLayoutPanel1 -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name searchButton -Value $searchButton -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name NameColumn -Value $NameColumn -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name ValidationStatement -Value $ValidationStatement -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name validateButtonColumn -Value $validateButtonColumn -MemberType NoteProperty
Add-Member -InputObject $IAOValidateForm -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
