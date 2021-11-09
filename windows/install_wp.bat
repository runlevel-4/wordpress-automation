@echo off
echo.
echo Setting up Windows IIS web server
dism /norestart /online /enable-feature /featurename:IIS-WebServerRole
timeout /t 3 /nobreak
echo.
echo Downloading and installing WordPress
curl https://wordpress.org/latest.zip --output %USERPROFILE%\latest.zip
tar -xf %USERPROFILE%\latest.zip -C %SYSTEMDRIVE%\inetpub\wwwroot
pause
