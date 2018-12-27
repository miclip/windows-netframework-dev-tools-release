# Windows .NET Framework Dev Tools-Release

This is a [BOSH](https://bosh.io) release to install .NET development tools on a Windows stemcell for .NET development. Primarily for use with bosh managed Concourse.

## Tools Installed

- [Chocolatey](https://chocolatey.org/) 
- [Powershell-PackageManagement](https://www.powershellgallery.com/packages/PackageManagement/1.1.7.2)
- [Visual studio 2017 community](https://visualstudio.microsoft.com/vs/community/)
- [Visual Studio 2017 dotnet core tools](https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2017#net-core-cross-platform-development)
- [Visual Studio2017 .NET Web](https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2017#aspnet-and-web-development)
- [Visual Studio 2017 Node.js](https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2017#nodejs-development) 
- [Visual Studio 2017 Azure](https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2017#azure-development)
- [Visual Studio 2017 Native Desktop](https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2017#desktop-development-with-c)
- [Visual Studio 2017 Managed Desktop](https://docs.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-community?view=vs-2017#net-desktop-development)
- [Node.js](https://chocolatey.org/packages/nodejs)
- [Cloud Foundry cli](https://docs.cloudfoundry.org/cf-cli/)
- [Nuget](https://docs.microsoft.com/en-us/nuget/tools/nuget-exe-cli-reference)

## Usage

Intended to be used as a BOSH [addon](https://bosh.io/docs/runtime-config/#update):

runtime.yml
~~~yml
releases:
- name: windows-netframework-dev-tools
  version: 7
addons:
- name: windows-dev-tools
  jobs:
  - name: windows-netframework-dev-tools
    release: windows-netframework-dev-tools
  include:
    stemcell:
    - os: windows1803
~~~