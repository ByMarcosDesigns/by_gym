ESX = nil
local traning = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function ()
    while true do 
        Citizen.Wait(0)
        local ms = true
        local pl = PlayerPedId()
        local plpos = GetEntityCoords(pl)
        for k, v in pairs(Config.Zones) do
            if byDist(plpos, v.pos, v.dist, true) then
                ms = false
                if v.type == 'gym' then
                    by3dMsg(Config.TextToGym .. "" .. v.label, v.pos)
                    if ByIsControl(1, 38) then
                        ESX.TriggerServerCallback('by_gym:checkMembership', function(haveMembership, traning)
                            if haveMembership then
                                print(traning)
                                if not traning then
                                    doExercise(v.anim, v.skill)
                                    Citizen.Wait(300)
                                else
                                    ESX.ShowNotification('You need to get some rest...')
                                    Citizen.Wait(300)
                                end
                            else
                                ESX.ShowNotification('It is necessary to have the membership card to exercise')
                                Citizen.Wait(300)
                            end
                        end, traning)
                        Citizen.Wait(300)
                    end
                elseif v.type == 'shop' then
                    by3dMsg(Config.TextToShop, v.pos)
                    if ByIsControl(1, 38) then
                        openShop(v.menu)
                        Citizen.Wait(300)
                    end
                end
            end
        end
        if ms then Citizen.Wait(600) end
    end
end)

doExercise = function (anim, skills)
    traning = true
    local pl = PlayerPedId()
    TaskStartScenarioInPlace(pl, anim, 0, true)
    Citizen.Wait(30000)
    ClearPedTasksImmediately(pl)
    ESX.ShowNotification("You need to rest a little, when I see you well and see that you can continue, I will let you know.")
    restCounter()

    if Config.EnableSkills then
        for k, v in pairs(skills) do
            print(v)
            exports[Config.NameExportSkill]:UpdateSkill(v.name, v.level)
        end
    end
end

restCounter = function()
    print('Counter')
    Citizen.Wait(Config.TimerToRest)
    ESX.ShowNotification('Now you can exercise again!')
    traning = false
end

openShop = function (data)
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'byShop',
    {
        title = "ByGym - Shop",
        align = 'right',
        elements = data,
    },
    function(data, menu)
        local value = data.current.value
        if value == "itemS" then
            itemShop()
        elseif value == 'ship' then
            confirmMembersip()
        end
    end, 
        function(data, menu)
        menu.close()
    end)

end

itemShop = function ()
    local elem = {}
    for k, v in pairs(Config.Items) do
        table.insert(elem, { label = v.label .. " - " .. v.price, value = v.item, price = v.price } )
    end
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'byShopItems',
    {
        title = "ByGym - Shops",
        align = 'right',
        elements = elem, 
    },
    function(data, menu)
        menu.close()
        itemShopQtt(data.current)
    end,
        function(data, menu)
        menu.close()
    end)
end

itemShopQtt = function (data)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'byShopItemsQtt',{
        title = ('ByShops')
    },
    function(data2, menu2)
        local var = data2.value

        if var == nil then
            ESX.ShowNotification('Enter a valid number!')
        else
            menu2.close()
            local num = tonumber(var)
            if num ~= nil then
                local prc = num * data.price
                ESX.TriggerServerCallback('by_gym:checkMoney', function(haveMoney) 
                    if haveMoney then
                        TriggerServerEvent('by_gym:payItem', data.item, num, prc)
                    else
                        ESX.ShowNotification("You don't have enought money!")
                    end
                end, prc)
                menu2.close()
            else
                ESX.ShowNotification('Enter a valid number!')
                menu2.close()
            end
        end
    end,
    function(data2, menu2)
        menu2.close()
    end)
end

confirmMembersip = function ()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'by_test',
    {
        title = "ByPlantillas",
        align = 'right',
        elements = { 
            { label = 'Yes - ' .. Config.MemberShipPrice .. "$", value = 'yes' },
            { label = 'No - Exit', value = 'no' },
        },
    },
    function(data, menu)
        local vl = data.current.value
        if vl == "yes" then
            ESX.TriggerServerCallback('by_gym:checkMoney', function(haveMoney)
                if haveMoney then
                    ESX.TriggerServerCallback('by_gym:checkMembership', function(haveMembership) 
                        if not haveMembership then
                            TriggerServerEvent('by_gym:payItem', 'gym_membership', 1, Config.MemberShipPrice)
                            ESX.ShowNotification('You bought one membership!')
                        else
                            ESX.ShowNotification('You already have a membership!!')
                        end
                    end)
                else
                    ESX.ShowNotification("You don't have enought money!")
                end
            end, Config.MemberShipPrice)
            menu.close()
        elseif vl == "no" then
            menu.close()
        end
    end, 
        function(data, menu)
        menu.close()
    end)
end

by3dMsg = function (msg, coords)
    if Config.Text3d then
        AddTextEntry('by3dNoti', msg)
        SetFloatingHelpTextWorldPosition(1, coords)
        SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
        BeginTextCommandDisplayHelp('by3dNoti')
        EndTextCommandDisplayHelp(2, false, false, -1)
    else
        SetTextComponentFormat("STRING")
        AddTextComponentString(msg)
        DisplayHelpTextFromStringLabel(0, 0, 1, -1)
    end

end

byDist = function (pos1, pos2, dist, bool)
    local distance = GetDistanceBetweenCoords(pos1, pos2, bool)

    if distance <= dist then
        return true
    else
        return false
    end
end

ByIsControl = function (gr, numb)
    local key = IsControlPressed(gr, numb)

    if key then 
        return true
    else
        return false
    end 
end