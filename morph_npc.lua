local NPC_ID = 999000 

local morphs = {
    { label = "Human Male", id = 19723 },
    { label = "Human Female", id = 19724 },
    { label = "Orc Female", id = 20316 },
    { label = "Orc Male", id = 21267 },
    { label = "Dwarf Male", id = 20317 },
    { label = "Night Elf Male", id = 20318 },
    { label = "Tauren Male", id = 20319 },
    { label = "Tauren Female", id = 20584 },
    { label = "Gnome Male", id = 20580 },
    { label = "Gnome Female", id = 20320 },
    { label = "Troll Male", id = 20321 },
    { label = "Blood Elf Male", id = 20578 },
    { label = "Blood Elf Female", id = 20322 },
    { label = "Draenei Male - Broken", id = 21105 },
    { label = "Draenei Female", id = 20323 },
    { label = "Blue Murloc", id = 506 },
    { label = "Rat Omzit", id = 2176 },
    { label = "Gluttonous Abomination", id = 7858 },
    { label = "Warewolf", id = 736 },
    { label = "Lich King", id = 24191 },
}

function OnGossipHello(event, player, unit)
    player:GossipMenuAddItem(0, "Restore original look", 0, 9999)
    for i, morph in ipairs(morphs) do
        player:GossipMenuAddItem(0, morph.label, 0, i)
    end
    player:GossipSendMenu(1, unit)
end

function OnGossipSelect(event, player, unit, sender, intid, code)
    if intid == 9999 then
        player:DeMorph()
        CharDBExecute("UPDATE characters SET custom_morph_displayid = NULL WHERE guid = "..player:GetGUIDLow())
    else
        local morph = morphs[intid]
        if morph then
            player:SetDisplayId(morph.id)
            CharDBExecute("UPDATE characters SET custom_morph_displayid = "..morph.id.." WHERE guid = "..player:GetGUIDLow())
        end
    end
    player:GossipComplete()
end

function OnLogin(event, player)
    local q = CharDBQuery("SELECT custom_morph_displayid FROM characters WHERE guid = "..player:GetGUIDLow())
    if q then
        local displayId = q:GetUInt32(0)
        if displayId and displayId ~= 0 then
            player:SetDisplayId(displayId)
        end
    end
end

RegisterCreatureGossipEvent(NPC_ID, 1, OnGossipHello)
RegisterCreatureGossipEvent(NPC_ID, 2, OnGossipSelect)
RegisterPlayerEvent(3, OnLogin) -- PLAYER_EVENT_ON_LOGIN

