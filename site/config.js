/* Izbrannik Gift — Firebase (Firestore REST). Rules: see FIREBASE_RULES.txt */
window.NEXVEN_CFG = {
  projectId: 'nexora-aa0f3',
  apiKey: 'AIzaSyAAw7lPLaShi_YOkvHHwzt17jiOFoHdb2Y',
  databases: ['(default)'],
  /* v39: адрес вашего ПК-сервера (туннель ngrok/cloudflared), например 'https://xxxx.ngrok-free.app'. Пусто = всегда Firebase.
     Какая база активна (ПК или Firebase) выбирается в консоли бота — http://127.0.0.1:8787/console или командой /db в боте. */
  pcApi: '',
  prefix: 'nx_',
  /* Telegram Stars -> TON rate: 1 Star = 0.0091 TON. This ONE number also prices every regular gift (gifts.js: stars / starsPerTon).
     The bot must use the same number: see BOT_STARS_RATE.txt. */
  /* v27: rate = 1 Star = 0.0091 TON (as on the reference screen). starsPerTon is derived from it (~109.89 Stars = 1 TON). The bot must use TON_PER_STAR = 0.0091. */
  tonPerStar: 0.0091,
  starsPerTon: 1 / 0.0091,
  /* v26: minimum Stars top-up (was 100) */
  depositMinStars: 10,
  /* v26/v28: gift withdrawal rules. Only gifts worth >= wdMinTon (3 TON) can be withdrawn, and only while the player has withdrawal access.
     Access = one Stars top-up of >= wdAccessStars in the bot, which unlocks free withdrawal for wdAccessDays days. */
  wdMinTon: 3,
  wdAccessStars: 100,
  wdAccessDays: 7,
  /* v28: minimum bet in the mini games (Plinko, Crash, Roulette, Mines) */
  minBet: 0.5
};
