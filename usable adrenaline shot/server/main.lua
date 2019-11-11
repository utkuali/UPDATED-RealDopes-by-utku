ESX.RegisterUsableItem('adrenaline_shot', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('adrenaline_shot', 1) -- item name and how many removed on usage
	TriggerClientEvent('esx_optionalneeds:onAdrenaline', source)
end)