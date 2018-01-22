RegisterServerEvent('wk_actionmenu:cuffGranted')
AddEventHandler('wk_actionmenu:cuffGranted', function(t)
	TriggerClientEvent('wk_actionmenu:getArrested', t)
end)



RegisterServerEvent('wk_actionmenu:dragRequest')
AddEventHandler('wk_actionmenu:dragRequest', function(t)
	TriggerClientEvent('wk_actionmenu:toggleDrag', t, source)
end)



RegisterServerEvent('wk_actionmenu:forceEnterAsk')
AddEventHandler('wk_actionmenu:forceEnterAsk', function(t, v)
	TriggerClientEvent('wk_actionmenu:forcedEnteringVeh', t, v)
end)

RegisterServerEvent('wk_actionmenu:confirmUnseat')
AddEventHandler('wk_actionmenu:confirmUnseat', function(t)
	TriggerClientEvent('wk_actionmenu:unseatme', t)
end)