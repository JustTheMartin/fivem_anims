-- HANDSUP
local dict = "random@mugging3"
local anim = "handsup_standing_base"
RegisterCommand('handsup', function()
     local ped = PlayerPedId()
    if not IsPedInAnyVehicle(ped, false) and not IsPedFalling(ped) then
        if not IsEntityPlayingAnim(ped, dict, anim, 3) then
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(500)
            end
            TaskPlayAnim(PlayerPedId(), dict, anim, 2.5, 2.5, -1, 50, 0, false, false, false)
        else
            StopAnimTask(PlayerPedId(), dict, anim, -2.5)
            RemoveAnimDict(dict)
        end
    end
end)

RegisterKeyMapping('handsup', Config.HandsupName, 'keyboard', Config.HandsupBind)
