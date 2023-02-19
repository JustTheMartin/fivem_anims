-- HANDSUP
local ped = PlayerPedId()

RegisterCommand('handsup', function()
    if not IsPedInAnyVehicle(ped, false) and not IsPedFalling(ped) then
        local dict = "random@mugging3"
        if not IsEntityPlayingAnim(oed, dict, "handsup_standing_base", 3) then
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(500)
            end
            TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 2.5, 2.5, -1, 50, 0, false, false, false)
        else
            StopAnimTask(PlayerPedId(), dict, "handsup_standing_base", -2.5)
            RemoveAnimDict(dict)
        end
    end
end)

RegisterKeyMapping('handsup', Config.HandsupName, 'keyboard', Config.HandsupBind)
