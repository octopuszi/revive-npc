ESX.RegisterServerCallback("octo_healnpc:getMoney", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cb(xPlayer.getMoney())
    end
end)

ESX.RegisterServerCallback("octo_healnpc:takeMoney", function(source, cb, money)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.removeMoney(money)
        cb(true)
    end
end)