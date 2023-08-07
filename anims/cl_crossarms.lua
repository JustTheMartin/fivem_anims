-- CROSSARMS
local dict = "anim@amb@nightclub@peds@"
local anim = "rcmme_amanda1_stand_loop_cop"
RegisterCommand('crossarms', function()
    local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) and not IsPedFalling(ped) then
        if not IsEntityPlayingAnim(ped, dict, anim, 3) then
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(500)
            end
            TaskPlayAnim(ped, dict, anim, 2.5, 2.5, -1, 50, 0, false, false, false)
        else
            StopAnimTask(ped, dict, anim, -2.5)
            RemoveAnimDict(dict)
        end
    end
end)

RegisterKeyMapping('crossarms', Config.CrossarmsName, 'keyboard', Config.CrossarmsBind)
