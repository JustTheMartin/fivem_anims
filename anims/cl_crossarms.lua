-- CROSSARMS
local crossarms = false

RegisterCommand('crossarms', function()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if not crossarms then
                local dict = "anim@amb@nightclub@peds@"
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Wait(500)
                end
                TaskPlayAnim(PlayerPedId(), dict, "rcmme_amanda1_stand_loop_cop", 2.5, 2.5, -1, 50, 0, false, false, false)
                RemoveAnimDict(dict)
                crossarms = true
        else
            crossarms = false
            ClearPedTasks(PlayerPedId())
        end
    end
end)

RegisterKeyMapping('crossarms', Config.CrossarmsName, 'keyboard', Config.CrossarmsBind)
