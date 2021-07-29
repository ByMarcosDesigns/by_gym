ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('by_gym:checkMembership', function(source, cb, traning)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xInventory = xPlayer.getInventoryItem('gym_membership')

    if xInventory.count >= 1  then
        cb(true, traning)
    else
        cb(false, traning)
    end
end)

ESX.RegisterServerCallback('by_gym:checkMoney', function(source, cb, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('by_gym:payItem')
AddEventHandler('by_gym:payItem', function (item, qtt, price)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    xPlayer.removeMoney(price)
    xPlayer.addInventoryItem(item, qtt)
end)