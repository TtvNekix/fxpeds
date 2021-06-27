FX = nil
Ped = nil

Citizen.CreateThread(function()
    while FX == nil do
            TriggerEvent('fx:get', function(core)
                FX = core
            end)
        Wait(0)
    end

    FX.Data = FX.GetData()

end)


RegisterNetEvent('fxpeds:putPed', function(ped)
    Ped = ped
    PutPed(Ped)
    FX.Notification("Ped Colocado correctamente", 'success')
end)

function PutPed(Ped)
    local ped = Ped
    local hash = GetHashKey(ped)

    RequestModel(hash)
    while not HasModelLoaded(hash) do 
        RequestModel(hash)
        Citizen.Wait(0)
    end    
    
    SetPlayerModel(PlayerId(), hash)
end