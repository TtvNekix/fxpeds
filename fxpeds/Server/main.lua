FX = nil
TriggerEvent('fx:get', function(core) FX = core end)

local this = FX.Functions()

RegisterCommand('peds', function(source, args, rawCommand)
    local player = FX.GetPlayerById(source)
    local identifier = player:Player().getSteam()
    local ped = args[1]

    if FXConfig.SteamBlacklist then
        for k, v in pairs(FXConfig.Steam) do
            if v == identifier then
                TriggerClientEvent('fx:notification', source, "Permiso concedido", "success")
                TriggerClientEvent('fxpeds:putPed', source, ped)
            else
                TriggerClientEvent('fx:notification', source, "No tienes permiso", "error")
            end
        end
    else
        TriggerClientEvent('fxpeds:putPed', source, ped)
    end
end) 