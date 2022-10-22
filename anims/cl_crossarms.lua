-- CROSSARMS
local crossarms = false

RegisterCommand('crossarms', function()
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
end)

RegisterKeyMapping('crossarms', 'Crossarms', 'keyboard', Config.CrossarmsBind)
