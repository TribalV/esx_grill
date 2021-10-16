
---------------------------------
-- Script: ESX_Grill
-- Discord: TribalWars#7042    
-- Simple script to grill any food 
-- you can use this base for anything else.    
---------------------------------


ESX = nil
local me = PlayerPedId()

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

end)

-- To grill: Peixe

RegisterNetEvent("peixe")
AddEventHandler("peixe",function(food)
    local item = food.item
    local count = food.count
    local xPlayer = ESX.GetPlayerData()
        TaskStartScenarioInPlace(PlayerPedId(), "prop_human_bbq", 0, true)
        exports['taskbar']:taskBar(10000,"A grelhar 1x " .. item)  
        Citizen.Wait(1000)

        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent("peixe:darItem", item, count)
end)

-- To grill: Salmão

RegisterNetEvent("salmao")
AddEventHandler("salmao",function(food)
    local item = food.item
    local count = food.count
    local xPlayer = ESX.GetPlayerData()
        TaskStartScenarioInPlace(PlayerPedId(), "prop_human_bbq", 0, true)
        exports['taskbar']:taskBar(10000,"A grelhar 1x " .. item) 
        Citizen.Wait(1000)

        ClearPedTasksImmediately(PlayerPedId())
        TriggerServerEvent("salmao:darItem", item, count)
end)

Citizen.CreateThread(function()
    local grelhador = { -- https://gtahash.site/?s=bbq
        1903501406,
		286252949,
		-770250239,
		977744387,
		519797612,
		-1608693916,
    }
     exports['bt-target']:AddTargetModel(grelhador, {
        options = {
            {
                event = "comidas:make",
                icon = "fas fa-hamburger",
                label = "Grelhar",
            },
        },
		job = {"all"},
        distance = 2.5
    })
end)
    


RegisterNetEvent('comidas:make', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1, -- The id must be inserted according to the previous number, if it is a 1 the next one will be 2 and so on. / O id deve ser inserido conforme o número anterior, se for 1 o próximo será 2 e assim sucessivamente.
            header = "Grelhar Peixe", -- Title / Título 
			txt = "", -- By default I left it blank, but you can enter a description if you want / Por norma eu deixei em branco, mas poderás inserir uma descrição caso queiras
            params = {
                event = "peixe", -- This field must be the same as the RegisterNetEvent created above. / Este campo deve ser igual ao RegisterNetEvent criado acima.
                args = {
                    item = 'fish', -- Name of the item in the database / Nome do item que esta na base de dados
                    count = 1, -- Quantity that will be delivered / Quantidade que será entregue
                }
            }
        },
        {
            id = 2,
            header = "Grelhar Salmão",
			txt = "",
            params = {
                event = "salmao",
                args = {
                    item = 'salmao',
                    count = 1,
                }
            }
        },
    })
end)