-- HANDSUP
local handsup = false

RegisterCommand('handsup', function()
    if not handsup then
        local dict = "random@mugging3"
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(500)
        end
        TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 2.5, 2.5, -1, 50, 0, false, false, false)
        RemoveAnimDict(dict)
        handsup = true
    else
        handsup = false
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterKeyMapping('handsup', Config.HandsupName, 'keyboard', Config.HandsupBind)
