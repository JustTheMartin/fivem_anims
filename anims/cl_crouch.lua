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
RegisterKeyMapping('crouch', Config.CrouchName, 'keyboard', Config.CrouchBind)
