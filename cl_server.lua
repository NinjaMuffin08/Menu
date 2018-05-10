_VERSION = '5.0.2'

-- Version check
PerformHttpRequest("https://github.com/rhys19/Menu/edit/master/version.txt", function(err, rText, headers)
	print("\nCurrent version: " .. _VERSION)

	if err == 200 then
		print("Updater version: " .. rText .. "\n")
		
		if rText ~= _VERSION then
			print("\nVersion mismatch, you are currently not using the newest stable version of Menu. Please update\n")
			log('Version mismatch was detected, updater version: ' .. rText .. '(' .. _VERSION .. ')')
		else
			print("Everything is fine!\n")
		end
	else
		print("Updater version: UPDATER UNAVAILABLE")
		print("This could be your internet connection or that the update server is not running. This won't impact the server\n\n")
	end
end, "GET", "", {what = 'this'})

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
