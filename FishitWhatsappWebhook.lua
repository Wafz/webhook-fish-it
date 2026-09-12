-- Fish It -> WhatsApp Webhook
-- Place in ServerScriptService
-- Hanya untuk Roblox experience yang kamu miliki/kelola.
-- Aktifkan Game Settings > Security > Allow HTTP Requests

local HttpService = game:GetService("HttpService")

local WEBHOOK_URL = "https://YOUR-DOMAIN.example/webhook/roblox"
local WEBHOOK_SECRET = "CHANGE_THIS_TO_YOUR_SECRET"

local function sendWebhook(eventName, playerName, fishName, rarity, message)
	local payload = {
		event = eventName or "Fish Event",
		player = playerName or "-",
		fish = fishName or "-",
		rarity = rarity or "-",
		message = message or ""
	}

	local success, response = pcall(function()
		return HttpService:RequestAsync({
			Url = WEBHOOK_URL,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["x-webhook-secret"] = WEBHOOK_SECRET
			},
			Body = HttpService:JSONEncode(payload)
		})
	end)

	if not success then
		warn("[FishIt Webhook] Request failed:", response)
		return false
	end

	if not response.Success then
		warn("[FishIt Webhook] HTTP error:", response.StatusCode, response.Body)
		return false
	end

	return true
end

-- Contoh:
-- sendWebhook(
--     "Rare Catch",
--     player.Name,
--     "Golden Shark",
--     "Legendary",
--     "Player caught a rare fish!"
-- )

return sendWebhook
