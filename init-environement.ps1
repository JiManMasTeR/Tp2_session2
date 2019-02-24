if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Write-host "Do you consent to download and install the following programs?
- Chocolatey (Package manager)
- PHP ( php distro )
- Composer (PHP package manager)
- Easy Less ( Vs Code extention )
- vs-Composer ( Vs Code extention )
- php-docblocker ( Vs Code extention )
- Material icon item ( Vs Code skin )
" -ForegroundColor Yellow;
$Readhost = Read-Host " ( y / n ) ";

Switch ($ReadHost) 
{ 
	Y { Write-host "Yes, Downloading programs..."; install-requirement; } 
	N { Write-Host "No, operation cancelled."; } 
	Default {Write-Host "Default, operation cancelled"; } 
}

function install-requirement () {
	try { choco.exe --version; } catch {
		#Source: choco
		Set-ExecutionPolicy Bypass -Scope Process -Force;
		Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'));
	}

	Start-Process -FilePath "choco.exe" -ArgumentList "--install php -y" -Verb RunAs;
	Start-Process -FilePath "choco.exe" -ArgumentList "--install composer -y" -Verb RunAs;
	code --install-extension mrcrowl.easy-less --force;
	code --install-extension PKief.material-icon-theme --force;
	code --install-extension ikappas.composer --force;
	code --install-extension neilbrayfield.php-docblocker --force;
	code --install-extension Gruntfuggly.todo-tree --force;
}