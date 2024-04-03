local canSpawn = true
local npcs = Config.ncps
local peds = {}

Citizen.CreateThread(function()
    while true do
        ped = PlayerPedId()
        coords = GetEntityCoords(ped)
        heading = GetEntityHeading(ped)
        Wait(500)
    end
end)

function delNPCS()
    for k, v in pairs(peds) do
        DeleteEntity(v)
    end
end

Citizen.CreateThread(function()
    while true do
        ESX.TriggerServerCallback("octo_revivenpc:getWorkers", function(callback)
            workers = callback
            if workers == 0 then
                if canSpawn then
                    spawnNPCS()
                    canSpawn = false
                end
            elseif workers > 0 then
                delNPCS()
                canSpawn = true
            end
        end)
        Wait(5000)
    end
end)

function spawnNPCS()
    for k, v in pairs(npcs) do
        loadModel(v.model)
        local ped = CreatePed(0, v.model, v.coords, false, false)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        SetPedCanBeTargetted(ped, false)
        FreezeEntityPosition(ped, true)
        table.insert(peds, ped)
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        if workers == 0 then
            for k, v in pairs(npcs) do
                local textCoords = v.textcoords
                local distance = #(textCoords-coords)
                if distance < 1.0 then
                    DrawText3Ds(textCoords[1], textCoords[2], textCoords[3], v.text)
                    if IsControlJustPressed(0, 38) then
                        ESX.TriggerServerCallback("octo_revivenpc:getMoney", function(callback)
                            if callback >= v.cost then
                                ESX.TriggerServerCallback("octo_revivenpc:takeMoney", function(done)
                                    if done then
                                        local tempcoords = GetEntityCoords(ped)
                                        SetEntityCoords(ped, v.bedcoords)
                                        exports['mythic_progbar']:Progress({
                                            name = "heal",
                                            duration = 1500,
                                            label = _U('reviveprocess'),
                                            useWhileDead = true,
                                            canCancel = false,
                                            controlDisables = {
                                                disableMovement = true,
                                                disableCarMovement = true,
                                                disableMouse = false,
                                                disableCombat = true,
                                            },
                                            animation = {
                                                animDict = "switch@trevor@annoys_sunbathers",
                                                anim = 'trev_annoys_sunbathers_loop_guy',--
                                                flags = 1,
                                            },
                                        }, function(cancelled)
                                            if not cancelled then
                                                reviveSelf()
                                                SetEntityCoords(ped, tempcoords)
                                                ESX.ShowNotification(_U('revived'))
                                            end
                                        end)
                                    end
                                end, v.cost)
                            else
                                ESX.ShowNotification(_U('nomoney'))
                            end
                        end)
                    end
                end
            end
        end
    end
end)

function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    delNPCS()
end)