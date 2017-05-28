param([string]$path,[string]$ProjectDir, [string]$cert);
Write-Host "-========================================================-";
Write-Host "-===            [PowerShell] Sign Tools               ===-";
Write-Host "-========================================================-";
Write-Host ("Path To Library: " + $path);
Write-Host ("Certificate: " + $cert);
Write-Host ("Project Dir: " + $ProjectDir);
if([System.IO.File]::Exists($ProjectDir + "/sign.pass") -ceq $false)
{
    Write-Error "sign.pass is not found!";
    exit 1;
}
if([System.IO.File]::Exists($ProjectDir + "/" + $cert) -ceq $false)
{
    Write-Error ("Certificate file ["+$cert+"] is not found!");
    exit 1;
}
$pass = [System.IO.File]::ReadAllText($ProjectDir + "/sign.pass");
Write-Host ("Password Sign: " + $pass);
Write-Host "-========================================================-";
$cmd = "C:\Program Files (x86)\Microsoft SDKs\ClickOnce\SignTool\signtool.exe";
$paramsCMD = @('sign', '/f', ($ProjectDir + $cert), '/p', $pass, '/v', $path);
& $cmd $paramsCMD;

if($lastexitcode -ceq 0)
{
    Write-Host ("Sign Complete!");
    exit $lastexitcode;
}
else 
{
    Write-Host  ("Sign Fail!");
    Write-Error ("Sign Fail!");
    exit $lastexitcode;
}