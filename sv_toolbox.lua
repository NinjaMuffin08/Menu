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

-- DO NOT REMOVE --

local CurrentVersion = '1.4'
local GithubResourceName = 'Menu'

PerformHttpRequest('https://raw.githubusercontent.com/rhys19/Menu/master/VERSION', function(Error, NewestVersion, Header)
	PerformHttpRequest('' .. GithubResourceName .. '/CHANGES', function(Error, Changes, Header)
		print('\n')
		print('--------------------------------------------------------------------')
		print('')
		print('M Menu')
		print('')
		print('Current Version: ' .. CurrentVersion)
		print('Newest Version: ' .. NewestVersion)
		print('Changelog: ' .. Changes)
		print('')
		if CurrentVersion ~= NewestVersion then
			print('--------------------------------------------------------------------')
		else
			print('-- Up to date!')
			print('--------------')
		end
		print('\n')
	end)
end)
