@echo off
chcp 65001 >nul
title Izbrannik Gift Bot
cd /d "%~dp0"

rem --- Python ---
set PY=python
where python >nul 2>nul
if errorlevel 1 (
  where py >nul 2>nul
  if errorlevel 1 (
    echo Python не найден. Установи Python 3.10+ с https://www.python.org/downloads/
    echo При установке поставь галочку "Add python.exe to PATH", затем запусти этот файл снова.
    pause
    exit /b 1
  )
  set PY=py -3
)

rem --- виртуальное окружение + зависимости (один раз, дальше быстро) ---
if not exist ".venv\Scripts\python.exe" (
  echo Первый запуск: создаю окружение и ставлю зависимости, подожди минуту...
  %PY% -m venv .venv
)
call ".venv\Scripts\activate.bat"
python -m pip install -q -r requirements.txt

rem --- настройки (.env): спрашиваем только то, чего не хватает ---
if exist ".env" goto envok
echo.
set /p BOT_TOKEN=Вставь токен бота от BotFather: 
> ".env" echo BOT_TOKEN=%BOT_TOKEN%
>> ".env" echo OWNER_ID=8133917568
>> ".env" echo ADMIN_IDS=8133917568
:envok
findstr /b /c:"WEBAPP_URL=https" ".env" >nul 2>nul
if not errorlevel 1 goto urlok
echo.
set /p WEBAPP_URL=Вставь ссылку на мини-апп, начиная с https: 
>> ".env" echo WEBAPP_URL=%WEBAPP_URL%
:urlok

:loop
echo.
echo [%date% %time%] Запуск бота. Окно не закрывай. Остановить: Ctrl+C
echo Консоль выбора базы ПК/Firebase: http://127.0.0.1:8787/console  ^(open_console.bat^)
python main.py
echo.
echo [%date% %time%] Бот остановился. Перезапуск через 5 секунд (закрой окно, чтобы выйти)...
timeout /t 5 /nobreak >nul
goto loop
