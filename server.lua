ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

end)

-- Verificação ver se o jogador tem peixe suficiente no inventário
-- Checking to see if the player has enough fish in the inventory

RegisterServerEvent('peixe:darItem')
AddEventHandler('peixe:darItem', function(item,count)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('fish').count
	if itemQuantity <1 then
				TriggerClientEvent('esx:showNotification', source, "Não tens peixe suficiente")
				return
			else
		xPlayer.removeInventoryItem(item, count)	
        xPlayer.addInventoryItem("fishgrelhado", count)
    end
end)

RegisterServerEvent('salmao:darItem')
AddEventHandler('salmao:darItem', function(item,count)
	local xPlayer  = ESX.GetPlayerFromId(source)
	local itemQuantity = xPlayer.getInventoryItem('salmao').count
	quantity = tonumber(itemQuantity)
	if quantity <1 then
				TriggerClientEvent('esx:showNotification', source, "Não tens salmão suficiente")
				return
			else
		xPlayer.removeInventoryItem(item, count)	
        xPlayer.addInventoryItem("salmaogr", count)
    end
end)
