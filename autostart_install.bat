@echo off
chcp 65001 >nul
cd /d "%~dp0"
schtasks /create /tn "NexvenDropBot" /tr "\"%~dp0start_bot.bat\"" /sc onlogon /f
if errorlevel 1 (echo Не удалось создать задачу. Запусти файл от имени администратора.) else (echo Готово: бот будет запускаться сам при входе в Windows.)
pause
