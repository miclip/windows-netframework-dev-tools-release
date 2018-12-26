#
#  include this in your powershells as:
#
#    . "c:\var\vcap\packages\windows-netframework-dev-tools\prelude.ps1"
#
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

function conditional-package-prepend-path {
    param ($dir)
    $dir = "c:\var\vcap\packages\$($dir)"
    if (test-path $dir) {
        prepend-path $dir
    }
}

function prepend-path {
    param ($dir)
    $env:PATH = $dir + ";" + $env:PATH
}

function system-cmd {
    param ($command)
    cmd.exe /c $command
    if (-not ($?)) {
        throw "$($command) failed"
    }
}

conditional-package-prepend-path "unzip\bin"
conditional-package-prepend-path "git\bin"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

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