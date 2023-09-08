-- CROUCH
local dict = 'move_ped_crouched'
local crouched = false
local c = false
RegisterCommand('crouch', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped, false) then
	    c = true
	    CreateThread(function()
		while c do
		    Wait(0)
		    local ped = PlayerPedId()
		    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
			DisableControlAction(0, 26, true)  
		    end
		end
	    end)
	    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then 
		if (not IsPauseMenuActive()) then 
		    if (IsDisabledControlJustPressed(0, 26)) then 
			RequestAnimSet(dict)
			while (not HasAnimSetLoaded(dict)) do 
			    Wait(1000)
			end 
			if crouched then 
			    ResetPedMovementClipset(ped, 0)
			    crouched = false 
			    Wait(1000)
			    c = false
			else
			    SetPedMovementClipset(ped, dict, 0.25)
			    RemoveAnimSet(dict)
			    crouched = true 
			end 
		    end
		end 
	    end 
	end
end)
RegisterKeyMapping('crouch', Config.CrouchName, 'keyboard', Config.CrouchBind)
