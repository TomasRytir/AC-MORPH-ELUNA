local NPC_ID = 999000
local NPC_LIFETIME_MS = 30000

function OnPlayerChat(event, player, msg, Type, lang)
    player:SendBroadcastMessage("[DEBUG] msgType: " .. Type .. " | text: " .. msg)

    if Type == 1 and msg:lower() == "summon morph" then
        local x, y, z, o = player:GetLocation()
        local npc = player:SpawnCreature(NPC_ID, x + 1, y, z, o, 3, NPC_LIFETIME_MS)

        if npc then
            player:SendBroadcastMessage("✅ NPC spawn ok (player:SpawnCreature)")
        else
            player:SendBroadcastMessage("❌ NPC spawn selhal")
        end
    end
end

RegisterPlayerEvent(18, OnPlayerChat)


