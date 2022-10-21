

--==================================
--========= Satış ==================
--==================================
Config = {
    Recipesss = {
        ["Gazino Çipi"] = {
            RequiredItemsss = {
                {Itemss = 'casinochips', Countss = 1}
            },
            GiveItemss = {Item = 'cash', labelss = 'Gazino Çipi', Countss = 1}
        }
    }
}


Config.NPCEnabless = true -- npc olup olmayacagı
Config.NPCHashss = "a_m_y_business_03" -- npc hash kodu
Config.NPCShopss = { x = 950.4328, y = 29.86766, z = 71.838, h = 280.08 }


Config.meslekismi = "casino"
Config.NPCLOG = "WEBHOOK YAPIŞTIR"


--==================================
--========= ORTADAKİ ARAÇ ==========
--==================================
Config.Vehicles = {
	[1] = {vehmodel ="nero2", coords = vector3(935.0234, 42.38583, 72.225), heading = 241.85}, -- Araç çıkarma
}


--================================================================================================
--========================
--======== ALIŞ ==========
--========================
Config.Items = {
    label = "Gazino Shop",
    slots = 10,
    items = {
        {
            name = "casinochips",
            price = 1,
            amount = 99999999999,
            type = "item",
            slot = 1,
        },
    }
}
