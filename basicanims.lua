local crossarms = false
RegisterCommand('crossarms', function()
    if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@narcotics@funding@gang_idle", "gang_chatting_idle01", 3) then
        if not crossarms then
            local dict = "anim@amb@nightclub@peds@"
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(500)
            end
            TaskPlayAnim(PlayerPedId(), dict, "rcmme_amanda1_stand_loop_cop", 2.5, 2.5, -1, 50, 0, false, false, false)
            crossarms = true
        else
            crossarms = false
            ClearPedTasks(PlayerPedId())
        end
    else
	Wait(500)
    end
end)

RegisterKeyMapping('crossarms', 'Crossarms', 'keyboard', 'g')

local handsup = false
RegisterCommand('handsup', function()
    if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@narcotics@funding@gang_idle", "gang_chatting_idle01", 3) then
        if not handsup then
            local dict = "random@mugging3"
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do
                Wait(500)
            end
            TaskPlayAnim(PlayerPedId(), dict, "handsup_standing_base", 2.5, 2.5, -1, 50, 0, false, false, false)
            handsup = true
        else
            handsup = false
            ClearPedTasks(PlayerPedId())
        end
    else
	Wait(500)
    end
end)

RegisterKeyMapping('handsup', 'Handsup', 'keyboard', 'x')
