Set-PSDebug -trace 1            # "set -x"
Set-PSDebug -strict             # "set -u"
$ErrorActionPreference = "Stop" # "set -e"

# avoid overly narrow default linewrap
$term = (get-host).ui.rawui
$size = $term.buffersize
$size.width = 128
$term.buffersize = $size
$size = $term.windowsize
$size.width = 128
$term.windowsize = $size

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression 

$env:Path +=";%ALLUSERSPROFILE%\chocolatey\bin"

choco install powershell-packagemanagement -y
choco install visualstudio2017community -y
choco install visualstudio2017-workload-netcoretools -y
choco install visualstudio2017-workload-netweb -y
choco install visualstudio2017-workload-node -y
choco install visualstudio2017-workload-azure -y
choco install visualstudio2017-workload-nativedesktop -y
choco install visualstudio2017-workload-manageddesktop -y
choco install nodejs.install -y
choco install cloudfoundry-cli -y
choco install nuget.commandline -y