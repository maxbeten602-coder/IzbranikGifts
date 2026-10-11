@echo off
chcp 65001 >nul
title Izbrannik Tunnel
cd /d "%~dp0"
where ngrok >nul 2>nul
if not errorlevel 1 goto have
echo ngrok не найден. Установи: открой PowerShell и выполни   winget install ngrok.ngrok
echo Потом один раз выполни:   ngrok config add-authtoken ТВОЙ_ТОКЕН   ^(токен на dashboard.ngrok.com, раздел Your Authtoken^)
pause
exit /b 1
:have
if exist "tunnel.txt" goto dom
echo Нужен бесплатный постоянный домен ngrok: dashboard.ngrok.com, раздел Domains, Create Domain.
set /p NGDOM=Вставь домен, например abc-def.ngrok-free.app: 
> "tunnel.txt" echo %NGDOM%
:dom
set /p NGDOM=<tunnel.txt
echo.
echo Туннель: https://%NGDOM%  =^>  этот ПК, порт 8787
echo Впиши этот адрес в config.js мини-аппа ^(pcApi^) и в .env бота ^(PUBLIC_URL^). Окно не закрывай.
echo.
:loop
ngrok http --domain=%NGDOM% 8787
echo Туннель остановился, перезапуск через 5 секунд...
timeout /t 5 /nobreak >nul
goto loop
