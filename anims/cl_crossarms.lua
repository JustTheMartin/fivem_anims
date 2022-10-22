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

RegisterKeyMapping('crossarms', 'Crossarms', 'keyboard', 'g')

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
        handsup = true
    else
        handsup = false
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterKeyMapping('handsup', 'Handsup', 'keyboard', 'x')

-- CROUCH
local crouched = false
RegisterCommand('crouch', function()
	local ped = PlayerPedId()
    c = true
    CreateThread(function()
        while c do
            Wait(0)
            local ped = PlayerPedId()
            if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
                DisableControlAction( 0, 26, true )  
            end
        end
    end)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
        if (not IsPauseMenuActive()) then 
            if (IsDisabledControlJustPressed(0, 26)) then 
                RequestAnimSet("move_ped_crouched")
                while (not HasAnimSetLoaded( "move_ped_crouched")) do 
                    Wait(1000)
                end 
                if (crouched == true) then 
                    ResetPedMovementClipset(ped, 0)
                    crouched = false 
                    Wait(1000)
                    c = false
                elseif (crouched == false) then
                    SetPedMovementClipset(ped, "move_ped_crouched", 0.25)
                    crouched = true 
                end 
            end
        end 
    end 
end)
RegisterKeyMapping('crouch', "Crouch", 'keyboard', 'c')
