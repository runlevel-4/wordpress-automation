@echo off
echo.
echo Setting up Windows IIS web server
dism /norestart /online /enable-feature /featurename:IIS-WebServer
timeout /t 3 /nobreak
echo.
echo Downloading and installing WordPress
curl https://wordpress.org/latest.zip
tar -xf latest.zip
