ESX.RegisterServerCallback("octo_revivenpc:getMoney", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        cb(xPlayer.getMoney())
    end
end)

ESX.RegisterServerCallback("octo_revivenpc:takeMoney", function(source, cb, money)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        xPlayer.removeMoney(money)
        cb(true)
    end
end)

ESX.RegisterServerCallback('octo_revivenpc:getWorkers', function(source, cb)
	local workers = 0
	for k, v in pairs(GetPlayers()) do 
        local xPlayer = ESX.GetPlayerFromId(v)
        if xPlayer then
            if Config.ambulanceJobs[xPlayer.getJob().name] then
                workers = workers + 1
            end
        end
	end
	cb(workers)
end)