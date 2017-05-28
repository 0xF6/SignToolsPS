# SignToolsPS
PowerShell script for sign library\exec

Copy the .pfx (Certificate PFX) file and sign.ps1(This script) into the root folder of the project.
Create a file sign.pass, and add in it the password from the .pfx certificate.
Add the following to the build event (after the build):
```PowerShell
powershell -ExecutionPolicy Unrestricted $(ProjectDir)sign.ps1 -ProjectDir $(ProjectDir) -path "$(ProjectDir)obj\$(ConfigurationName)\$(TargetFileName)" -cert "%CERTIFICATE_NAME%"
```
Where:
- %CERTIFICATE_NAME% — The name of your certificate (the location of which is the root folder of the project)
