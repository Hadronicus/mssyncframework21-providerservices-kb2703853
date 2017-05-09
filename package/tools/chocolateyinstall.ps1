$ErrorActionPreference = 'Stop'; # stop on all errors
$packageName           = 'mssyncframework21-providerservices-kb2703853'
$toolsDir              = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if([System.IntPtr]::Size -ne 4)
{
    $fileLocation = Join-Path $toolsDir 'ProviderServices-KB2703853-v2.1-x64-ENU.msi'
    $checksum     = 'AAA7005F1076D3B7D58769E0782ED72AFD3F70A3DCA041E0E4E92B99FEA415D76CDBF4DE79DD9E8FE759BACCEE51C8CFAB7EF5BB1428AFF1006EDF6B2C9DA6D3'
    $checksumType = 'sha512'
}
else
{
    $fileLocation = Join-Path $toolsDir 'ProviderServices-KB2703853-v3.1-x86-ENU.msi'
    $checksum     = '09662D810AAA6A33EACA5AC23ABC798B65E27CF77077B25FC4410EBBF934576E0A1397D2C23A313F448A2F4DD384816AD726716A9C4EC03FCC9BE5D4E1CD92CF'
    $checksumType = 'sha512'
}

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  file          = $fileLocation
  softwareName  = 'mssyncframework21-providerservices-kb2703853*'
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs