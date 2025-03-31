Add-Type -AssemblyName System.Windows.Forms

$mainPath = "$PSScriptRoot"

$form = New-Object System.Windows.Forms.Form
$form.Text = 'AutoVPN'
$form.Size = New-Object System.Drawing.Size(320, 200)
$form.StartPosition = 'CenterScreen'

$connectButton = New-Object System.Windows.Forms.Button
$connectButton.Text = '🔌 Подключить VPN'
$connectButton.Size = New-Object System.Drawing.Size(250,30)
$connectButton.Location = New-Object System.Drawing.Point(30,20)
$connectButton.Add_Click({Start-Process -FilePath "$mainPath\connect.bat" -WindowStyle Hidden})
$form.Controls.Add($connectButton)

$disconnectButton = New-Object System.Windows.Forms.Button
$disconnectButton.Text = '❌ Отключить VPN'
$disconnectButton.Size = New-Object System.Drawing.Size(250,30)
$disconnectButton.Location = New-Object System.Drawing.Point(30,60)
$disconnectButton.Add_Click({Start-Process -FilePath "$mainPath\disconnect.bat" -WindowStyle Hidden})
$form.Controls.Add($disconnectButton)

$exitButton = New-Object System.Windows.Forms.Button
$exitButton.Text = '🚪 Выход'
$exitButton.Size = New-Object System.Drawing.Size(250,30)
$exitButton.Location = New-Object System.Drawing.Point(30,100)
$exitButton.Add_Click({$form.Close()})
$form.Controls.Add($exitButton)

$form.ShowDialog()
