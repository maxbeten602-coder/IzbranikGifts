#!/usr/bin/env bash
# Linux / macOS: ./start_bot.sh
cd "$(dirname "$0")"
[ -d .venv ] || python3 -m venv .venv
source .venv/bin/activate
pip install -q -r requirements.txt
if [ ! -f .env ]; then
  read -rp "BOT_TOKEN: " T; read -rp "WEBAPP_URL: " U
  printf "BOT_TOKEN=%s\nWEBAPP_URL=%s\nOWNER_ID=8133917568\nADMIN_IDS=8133917568\n" "$T" "$U" > .env
fi
while true; do python main.py; echo "Бот остановился, перезапуск через 5 с..."; sleep 5; done
