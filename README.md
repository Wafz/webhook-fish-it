# Fish It → WhatsApp Webhook

Webhook untuk mengirim event dari Roblox ke WhatsApp melalui server webhook.

## Struktur

FishIt-WhatsApp-Webhook/
├── README.md
├── FishItWhatsAppWebhook.lua
└── .gitignore

## Instalasi Roblox

1. Buka Roblox Studio.
2. Masukkan `FishItWhatsAppWebhook.lua` ke `ServerScriptService`.
3. Aktifkan:
   Game Settings → Security → Allow HTTP Requests
4. Ganti:

WEBHOOK_URL = "https://YOUR-DOMAIN.example/webhook/roblox"

dengan URL server webhook milikmu.

5. Ganti `WEBHOOK_SECRET` dengan secret yang sama di server.

## Contoh

sendWebhook(
    "Rare Catch",
    player.Name,
    "Golden Shark",
    "Legendary",
    "Player caught a rare fish!"
)

## Keamanan

Jangan memasukkan:
- WhatsApp access token
- Roblox cookie
- Password
- Session token

ke dalam script Roblox atau repository GitHub.

Token WhatsApp harus tetap berada di server webhook.
