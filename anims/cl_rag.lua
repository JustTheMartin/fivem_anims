-- RAG 
RegisterCommand("rag", function(source, args, raw)
    if not ragdol then
        ragdol = true
        CreateThread(function()
            local ped = PlayerPedId()
            while ragdol do
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                Wait(0)
            end
        end)
    else
        ragdol = false
    end
end, false)

RegisterKeyMapping('rag', Config.RagName, 'keyboard', Config.RagBind)
