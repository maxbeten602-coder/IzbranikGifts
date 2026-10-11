IZBRANNIK GIFT — ВСЁ В ОДНОЙ ПАПКЕ
================================
bot/ + main.py + .env ... — Telegram-бот (@nexvendrop_bot)
site/                     — мини-апп (сайт)

1) САЙТ -> GitHub Pages (https://maxbeten602-coder.github.io/IzbranikGifts/)
   Залей СОДЕРЖИМОЕ папки site/ (index.html, *.js, style.css, img/ ...) в корень репозитория
   maxbeten602-coder/IzbranikGifts (ветка main, Settings > Pages > Deploy from branch / root).
   Через ~1 минуту сайт открывается по ссылке выше.

2) БОТ -> хост/ПК
   Хост (Railway/Bothost и т.п.): загрузи ВСЮ эту папку, команда запуска: python main.py
   (requirements.txt подтянется сам). Переменные уже в .env (токен, админ 8133917568, WEBAPP_URL).
   ПК (Windows): запусти start_bot.bat (автозапуск: autostart_install.bat).

3) BotFather: /mybots -> @nexvendrop_bot -> Bot Settings -> Menu Button / Configure Mini App ->
   URL: https://maxbeten602-coder.github.io/IzbranikGifts/

4) БАЗА: Firebase проект nexora-aa0f3 -> Firestore Database -> Create -> правила из site/FIREBASE_RULES.txt.
   (Режим "ПК-база" опционально: start_tunnel.bat + pcApi в site/config.js.)

Админ только Telegram ID 8133917568. Запускай ОДИН экземпляр бота.
