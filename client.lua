QBCore = nil
PlayerData = {}
menu = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end

	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUptade')
AddEventHandler('QBCore:Client:OnJobUptade', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('sonerr:client:Openseller:Casino')
AddEventHandler('sonerr:client:Openseller:Casino', function(playerData, actv)
    if PlayerData.job and PlayerData.job.name == Config.meslekismi then
    soenrbeyss()
    Citizen.Wait(120000)
    QBCore.UI.Menu.CloseAll()
    SetNuiFocus(false, false)
    else
        QBCore.Functions.Notify("Gazino Çalışanı değilsin?", "error")
    end
end)


function soenrbeyss()
    QBCore.UI.Menu.CloseAll()
    local elements = {}

    for k,v in pairs(Config.Recipesss) do
        table.insert(elements, {label = v.GiveItemss.labelss, value = k})
    end

	QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'toptanci_default', {
		title = '',
		align = 'top-left',
        elements = elements
    },function(data, menu)
		if data.current.value then
            QBCore.UI.Menu.Open('dialog', GetCurrentResourceName(), 'toptanci_dialog',
            {
                title = "Ne kadar dönüştüreceksin?"
            },
            function(data3, menu3)
                local yazilanmiktar = tonumber(data3.value)
                if yazilanmiktar < 1111111111 then
                    TriggerServerEvent('toptanci:item:casino', data.current.value, yazilanmiktar)
                    menu3.close()
                else
                    QBCore.Functions.Notify("Hatalı Miktar!", "error")
                end
            end, function(data3, menu3)
                menu3.close()
                menuacik = false
            end)
        else
            menu.close()
		end
    end, function(data, menu)
        menu.close()
	end)
end

exports['qb-target']:AddTargetModel("a_m_y_business_03", {
    options = {
        {
            type = "client",
            event = "sonerr:client:Openseller:Casino",
            icon = "fas fa-shopping-cart",
            label = "Çip Sat",
        },
    },
    distance = 3.5,
})

Citizen.CreateThread(function()
    if Config.NPCEnabless == true then
        RequestModel(Config.NPCHashss)
        while not HasModelLoaded(Config.NPCHashss) do
            Wait(1)
        end
    
        stanleyss = CreatePed(1, Config.NPCHashss, Config.NPCShopss.x, Config.NPCShopss.y, Config.NPCShopss.z-1, Config.NPCShopss.h, false, true)
        SetBlockingOfNonTemporaryEvents(stanleyss, true)
        SetPedDiesWhenInjured(stanleyss, false)
        SetPedCanPlayAmbientAnims(stanleyss, true)
        SetPedCanRagdollFromPlayerImpact(stanleyss, false)
        SetEntityInvincible(stanleyss, true)
        FreezeEntityPosition(stanleyss, true)
        TaskStartScenarioInPlace(stanleyss, "WORLD_HUMAN_CLIPBOARD", 0, true);
    end
end)













--===============================--===============================--===============================


RegisterNetEvent('soner:sik:beni')
AddEventHandler('soner:sik:beni', function(playerData, actv)
    if PlayerData.job and PlayerData.job.name == Config.meslekismi then
    TriggerServerEvent("inventory:server:OpenInventory", "shop", Config.meslekismi, Config.Items)
    else
        QBCore.Functions.Notify("Gazino çalışanı değilsin?", "error")
    end
end)

Citizen.CreateThread(function()
	Citizen.Wait(5)
	for a, j in pairs(Config.Vehicles) do
		RequestModel(j.vehmodel)
		while not HasModelLoaded(j.vehmodel) do
			Citizen.Wait(1)
		end
		local veh = CreateVehicle(GetHashKey(j.vehmodel), j.coords.x, j.coords.y, j.coords.z-1.0, j.heading,  false, true)
		SetVehicleDoorsLocked(veh, 2)
		FreezeEntityPosition(veh, true)
	end
end)


exports['qb-target']:AddTargetModel("a_m_y_business_03", {
    options = {
        {
            type = "client",
            event = "soner:sik:beni",
            icon = "fas fa-shopping-cart",
            label = "Çip Satın Al",
        },
    },
    distance = 3.5,
})