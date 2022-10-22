local mp_pointing = false
local keyPressed = false
local function startPointing()
    RequestAnimDict("anim@mp_point")
    while not HasAnimDictLoaded("anim@mp_point") do Wait(0) end
    SetPedCurrentWeaponVisible(playerPed, 0, 1, 1, 1)
    SetPedConfigFlag(playerPed, 36, 1)
    Citizen.InvokeNative(0x2D537BA194896636, playerPed, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
    RemoveAnimDict("anim@mp_point")
end
local function stopPointing()
    Citizen.InvokeNative(0xD01015C7316AE176, playerPed, "Stop")
    if not IsPedInjured(playerPed) then ClearPedSecondaryTask(playerPed) end
    if not IsPedInAnyVehicle(playerPed, 1) then
        SetPedCurrentWeaponVisible(playerPed, 1, 1, 1, 1)
    end
    SetPedConfigFlag(playerPed, 36, 0)
    ClearPedSecondaryTask(playerPed)
end
RegisterCommand('point', function()
    if not mp_pointing and IsPedOnFoot(playerPed) then
        Wait(200)
        keyPressed = true
        startPointing()
        mp_pointing = true
        CreateThread(function()
            while mp_pointing do
                Wait(0)
                if Citizen.InvokeNative(0x921CE12C489C4C41, playerPed) then
                    if not IsPedOnFoot(playerPed) then
                        stopPointing()
                    else
                        local camPitch = GetGameplayCamRelativePitch()
                        if camPitch < -70.0 then
                            camPitch = -70.0
                        elseif camPitch > 42.0 then
                            camPitch = 42.0
                        end
                        camPitch = (camPitch + 70.0) / 112.0
                        local camHeading = GetGameplayCamRelativeHeading()
                        local cosCamHeading = Cos(camHeading)
                        local sinCamHeading = Sin(camHeading)
                        if camHeading < -180.0 then
                            camHeading = -180.0
                        elseif camHeading > 180.0 then
                            camHeading = 180.0
                        end
                        camHeading = (camHeading + 180.0) / 360.0
                        local blocked = 0
                        local nn = 0
                        local coords = GetOffsetFromEntityInWorldCoords(playerPed, (cosCamHeading *     -0.2) -     (sinCamHeading *         (0.4 *             camHeading +             0.3)), (sinCamHeading *     -0.2) +     (cosCamHeading *         (0.4 *             camHeading +             0.3)), 0.6)
                        local ray = StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, playerPed, 7); nn, blocked, coords, coords = GetRaycastResult(ray)
                        Citizen.InvokeNative(0xD5BB4025AE449A4E, playerPed, "Pitch", camPitch)
                        Citizen.InvokeNative(0xD5BB4025AE449A4E, playerPed,  "Heading", camHeading * -1.0 + 1.0)
                        Citizen.InvokeNative(0xB0A6CFD2C69C1088, playerPed, "isBlocked", blocked)
                        Citizen.InvokeNative(0xB0A6CFD2C69C1088, playerPed, "isFirstPerson", Citizen.InvokeNative( 0xEE778F8C7E1142E2, Citizen.InvokeNative( 0x19CAFA3C87F7C2FF)) == 4)
                    end
                end
            end
        end)        
    elseif mp_pointing or (not IsPedOnFoot(playerPed) and mp_pointing) then
        keyPressed = true
        mp_pointing = false
        stopPointing()
    end

end, false)

RegisterKeyMapping('point', 'PointFinger', 'keyboard', Config.PointFingerBind)
