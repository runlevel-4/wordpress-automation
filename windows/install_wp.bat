@echo off
echo.
echo Setting up Windows IIS web server
dism /norestart /online /enable-feature /featurename:IIS-WebServer
