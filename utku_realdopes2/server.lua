local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

RegisterServerEvent("utku_realdopes2:üretim") -- Taking required items from player and start producing // Gerekli itemleri oyuncudan alma ve üretimi başlatma
AddEventHandler("utku_realdopes2:üretim", function()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    -- Giving value to items for check // Kontrol için itemlere değer verme
    local currentEpinefrin = xPlayer.getInventoryItem("epinephrine")["count"]
    local currentSiringa = xPlayer.getInventoryItem("syringe")["count"]
    local currentSod = xPlayer.getInventoryItem("sodium")["count"]

    if currentEpinefrin >= 40 then -- Checks if player has enough item // Oyuncunun yeterki kadar itemi var mı kontrolü
         if currentSiringa >= 10 then
            if currentSod >= 10 then
                xPlayer.removeInventoryItem("epinephrine", 40) -- Removing items // İtemleri oyuncudan silme
                xPlayer.removeInventoryItem("syringe", 10)
                xPlayer.removeInventoryItem("sodium", 10)

                    TriggerClientEvent("utku_realdopes2:üretimBaşla", _source) -- Start producing // Üretime başlama
                else
                    TriggerClientEvent("esx:showNotification", _source, _U("no_item")) -- Not enough item notification // Yeteri kadar item yok bildirimi
                end
            else
                TriggerClientEvent("esx:showNotification", _source, _U("no_item"))
            end
        else
            TriggerClientEvent("esx:showNotification", _source, _U("no_item"))
        end
end)

RegisterServerEvent('utku_realdopes2:bitti') -- Finish and giving items // Bitiş ve item verme
AddEventHandler('utku_realdopes2:bitti', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem('adrenaline_shot', 10)
end)