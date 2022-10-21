QBCore = nil
local DISCORDS_NAME = "SNR DEVELOPMENT"
local DISCORDS_IMAGE = ""
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('toptanci:item:casino')
AddEventHandler('toptanci:item:casino', function(item, miktar)
    local xPlayer = QBCore.Functions.GetPlayer(source)

    for k,v in pairs(Config.Recipesss[item].RequiredItemsss) do
        if xPlayer.Functions.GetItemByName(v.Itemss).amount >= miktar then
            paramiktar = Config.Recipesss[item].GiveItemss.Countss * miktar
			xPlayer.Functions.RemoveItem(v.Itemss, miktar)
			xPlayer.Functions.AddMoney('cash', paramiktar)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['cash'],'add', paramiktar)
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[v.Itemss],'remove', miktar)

            sendToDiscord("Casino Satış", " **"..getPlayerInfo(source).."** kişisi toptancıya **".. miktar .. "x " ..item .."** sattı, **" .. paramiktar .. "$** kazandı.", 16744576, Config.NPCLOG)
			TriggerClientEvent("QBCore:Notify", source, ''.. miktar ..'x '.. item .. ' sattın, ' .. paramiktar .. '$ kazandın.', "success")
        else
			TriggerClientEvent("QBCore:Notify", source, 'Üzerinizde '..miktar..'x ' ..item..' yok!', "error")
        end
    end
end)

function sendToDiscord(name, message, color, selam)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = os.date('!%Y-%m-%d - %H:%M:%S') .. " - SNR DEVELOPMENT",
			  },
		  }
	  }
	PerformHttpRequest(selam, function(err, text, headers) end, 'POST', json.encode({username = DISCORDS_NAME, embeds = connect, avatar_url = DISCORDS_IMAGE}), { ['Content-Type'] = 'application/json' })
end

function getPlayerInfo(player)
	local _player = player
	local infoString = GetPlayerName(_player) .. " (" .. _player .. ")"
	-- if Config.BilgileriPaylas then
		for k,v in pairs(GetPlayerIdentifiers(_player)) do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				infoString = infoString .. "\n<@" .. string.gsub(v,"discord:","") .. ">"
			else
				infoString = infoString .. "\n" .. v
			end
		end
	-- end
	return infoString
end