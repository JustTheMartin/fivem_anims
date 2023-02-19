-- CROSSARMS
local ped = PlayerPedId()

RegisterCommand('crossarms', function()
    if not IsPedInAnyVehicle(ped, false) and not IsPedFalling(ped) then
        local dict = "anim@amb@nightclub@peds@"
        if not IsEntityPlayingAnim(oed, dict, "rcmme_amanda1_stand_loop_cop", 3) then
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(500)
            end
            TaskPlayAnim(ped, dict, "rcmme_amanda1_stand_loop_cop", 2.5, 2.5, -1, 50, 0, false, false, false)
        else
            StopAnimTask(ped, dict, "rcmme_amanda1_stand_loop_cop", -2.5)
            RemoveAnimDict(dict)
        end
    end
end)

RegisterKeyMapping('crossarms', Config.CrossarmsName, 'keyboard', Config.CrossarmsBind)
