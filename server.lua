if Config.Framework == 'esx' then 
    ESX = exports.es_extended:getSharedObject()
elseif Config.Framework == 'qbcore' then
    QBCore = exports['qb-core']:GetCoreObject()
end



GiveItem = function(source, item, count)
    if Config.Framework == 'esx' then 
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.addInventoryItem(item, count)
    elseif Config.Framework == 'qbcore' then
        QBCore.Functions.AddItem(source, item, count)
    end
end

RegisterNetEvent('ricky-rewards:giveItem')
AddEventHandler('ricky-rewards:giveItem', function(item, count)
  GiveItem(source, item, count)
end)