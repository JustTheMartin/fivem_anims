-- RAG
RegisterCommand("rag", function(source, args, raw)
	if not ragdol then
		    ragdol = true
        Citizen.CreateThread(function()
            while ragdol do
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                Citizen.Wait(0)
            end
        end)
    else
		    ragdol = false
    end
end, false)

RegisterKeyMapping('rag', Config.CrossarmsName, 'keyboard', Config.CrossarmsBind)
