--[[------------------------------------------------------------------------

	ActionMenu 
	Created by WolfKnight
	Additional help from lowheartrate, TheStonedTurtle, and Briglair. 

------------------------------------------------------------------------]]--

--[[------------------------------------------------------------------------
    Resource Rename Fix 
------------------------------------------------------------------------]]--
Citizen.CreateThread( function()
    Citizen.Wait( 1000 )
    local resourceName = GetCurrentResourceName()
    SendNUIMessage( { resourcename = resourceName } )
end )

-- Define the variable used to open/close the menu 
local menuEnabled = false 
--[[------------------------------------------------------------------------
	ActionMenu Toggle
	Calling this function will open or close the ActionMenu. 
------------------------------------------------------------------------]]--
function ToggleActionMenu()
	-- Make the menuEnabled variable not itself 
	-- e.g. not true = false, not false = true 
	menuEnabled = not menuEnabled

	if ( menuEnabled ) then 
		-- Focuses on the NUI, the second parameter toggles the 
		-- onscreen mouse cursor. 
		SetNuiFocus( true, true )

		-- Sends a message to the JavaScript side, telling it to 
		-- open the menu. 
		SendNUIMessage({
			showmenu = true 
		})
	else 
		-- Bring the focus back to the game
		SetNuiFocus( false )

		-- Sends a message to the JavaScript side, telling it to
		-- close the menu.
		SendNUIMessage({
			hidemenu = true 
		})
	end 
end 

--[[------------------------------------------------------------------------
	ActionMenu HTML Callbacks
	This will be called every single time the JavaScript side uses the
	sendData function. The name of the data-action is passed as the parameter
	variable data. 
------------------------------------------------------------------------]]--
RegisterNUICallback( "ButtonClick", function( data, cb ) 
	if ( data == "handsup" ) then 
		handsUp()
                
	elseif ( data == "hood" ) then
   	 TriggerEvent( 'openHood' )
                
	elseif ( data == "trunk" ) then
   	 TriggerEvent( 'openTrunk' )
                
	elseif ( data == "engine" ) then 
	       TriggerEvent( 'EngineToggle:Engine' )
                
    elseif ( data == "button6" ) then
            TriggerEvent( 'KneelHU' )

    elseif ( data == "radar" ) then 
        TriggerEvent( 'wk:radarRC' )

    elseif ( data == "cuff" ) then 
        TriggerEvent( 'Cuff_close:getcuff' )

    --elseif ( data == "gh" ) then -- DOESN'T STOP PLAYING ANIMATION
        --TriggerEvent( 'Holster' )
		
	--elseif ( data == "r" ) then -- Doesn't Stop Playing Animation Don't enable unless you can fix it!
      --  TriggerEvent ( 'Radio' )
		
	elseif ( data == "drag" ) then
        TriggerEvent ( 'Cuff_close:getDrag' )
		
	elseif ( data == "seat" ) then
        TriggerEvent ( 'Cuff_close:getSeatedVehicle' )
		
	elseif ( data == "unseat" ) then
        TriggerEvent ( 'Cuff_close:getUnseatVehicle' )
		
	elseif ( data == "window" ) then
        TriggerEvent ( 'RollWindow' )

	elseif ( data == "exit" ) then 
		-- We toggle the ActionMenu and return here, otherwise the function 
		-- call below would be executed too, which would just open the menu again 
		ToggleActionMenu()
		return 
	end 

	-- This will only be called if any button other than the exit button is pressed
	ToggleActionMenu()
end )


--[[------------------------------------------------------------------------
	ActionMenu Control and Input Blocking 
	This is the main while loop that opens the ActionMenu on keypress. It 
	uses the input blocking found in the ES Banking resource, credits to 
	the authors.
------------------------------------------------------------------------]]--
Citizen.CreateThread( function()
	-- This is just in case the resources restarted whilst the NUI is focused. 
	SetNuiFocus( false )

	while true do 
		-- Control ID 20 is the 'Z' key by default 
		-- Use https://wiki.fivem.net/wiki/Controls to find a different key 
		if ( IsControlJustPressed( 1, 244 ) ) then 
			ToggleActionMenu()
		end 

	    if ( menuEnabled ) then
            local ped = GetPlayerPed( -1 )	

            DisableControlAction( 0, 1, true ) -- LookLeftRight
            DisableControlAction( 0, 2, true ) -- LookUpDown
            DisableControlAction( 0, 24, true ) -- Attack
            DisablePlayerFiring( ped, true ) -- Disable weapon firing
            DisableControlAction( 0, 142, true ) -- MeleeAttackAlternate
            DisableControlAction( 0, 106, true ) -- VehicleMouseControlOverride
        end

		Citizen.Wait( 0 )
	end 
end )

function chatPrint( msg )
	TriggerEvent( 'chatMessage', "ActionMenu", { 255, 255, 255 }, msg )
end 

--handsup
local handsup = false

function handsUp()
    local dict = "missminuteman_1ig_2"
    
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(0)
	end
	if not handsup then
		TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
		handsup = true
	else
		handsup = false
		ClearPedTasks(GetPlayerPed(-1))
	end
end

--KneelHU Start
 
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end
 
RegisterNetEvent( 'KneelHU' )
AddEventHandler( 'KneelHU', function()
    local player = GetPlayerPed( -1 )
    if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
        loadAnimDict( "random@arrests" )
        loadAnimDict( "random@arrests@busted" )
        if ( IsEntityPlayingAnim( player, "random@arrests@busted", "idle_a", 3 ) ) then
            TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (500)
            TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
            Wait (1000)
            TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
            DisableControlAction(0,21,true)
        end
    end
end)

--KneelHU End

--engine start--

RegisterNetEvent('Engine')

AddEventHandler('Engine', function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then 
		if (GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1)) then
			if IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
				SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), false)
				drawNotification("~r~Turned Engine Off!")
			else
				SetVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
				drawNotification("~g~Turned Engine On!")
			end
		else 
			ShowNotification("You have to be in the driver's seat of a vehicle!")
		end 
    end 
end)

function drawNotification(text) --Just Don't Edit!
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

--Engine end--

--Trunk start

-- Hood Command

AddEventHandler( 'chatMessage', function(source, n, message)
    if (message == "/hood" ) then
        TriggerClientEvent('hoodMessage', source)	
        TriggerClientEvent('openHood', source)
    end 
end)

-- Trunk Command

AddEventHandler( 'chatMessage', function(source, n, message)
    if (message == "/trunk" ) then
        TriggerClientEvent('trunkMessage', source)	
        TriggerClientEvent('openTrunk', source)
    end 
end)

RegisterNetEvent( 'openTrunk' )
AddEventHandler( 'openTrunk', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
            SetVehicleDoorShut(veh, 5, false)
        else
            SetVehicleDoorOpen(veh, 5, false, false)
        end
    end
end, false)

RegisterNetEvent( 'openHood' )
AddEventHandler( 'openHood', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
            SetVehicleDoorShut(veh, 4, false)
        else
            SetVehicleDoorOpen(veh, 4, false, false)
        end
    end
end, false)

-- Notifications
RegisterNetEvent( 'trunkMessage' )
AddEventHandler( 'trunkMessage', function()
    drawNotification("~g~You opened your trunk.")
end)

RegisterNetEvent( 'hoodMessage' )
AddEventHandler( 'hoodMessage', function()
    drawNotification("~g~You opened your hood.")
end)

-- Notification Function
function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

--Trunk End

--HandCuff start

RegisterNetEvent('cuff')
AddEventHandler('cuff', function()
	handCuffed = not handCuffed
	if(handCuffed) then
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		
				
		if (handCuffed) then
			RequestAnimDict('mp_arresting')

			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(0)
			end

			local myPed = PlayerPedId(-1)
			local animation = 'idle'
			local flags = 16
			
			while(IsPedBeingStunned(myPed, 0)) do
				ClearPedTasksImmediately(myPed)
			end
			TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)
		end

--[[---------------------]]--

--[[ HANDSUP SCRIPT ]]--
RegisterNetEvent("Handsup")
AddEventHandler("Handsup", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		if not IsEntityPlayingAnim(lPed, "mp_arresting", "idle", 3) then
			RequestAnimDict("random@mugging3")
			while not HasAnimDictLoaded("random@mugging3") do
				Citizen.Wait(100)
			end
			
			if IsEntityPlayingAnim(lPed, "random@mugging3", "handsup_standing_base", 3) then
				ClearPedSecondaryTask(lPed)
				SetEnableHandcuffs(lPed, false)
				SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
				TriggerEvent("chatMessage", "", {255, 0, 0}, "Your have put your hands down.")
			else
				TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(lPed, true)
				SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
				TriggerEvent("chatMessage", "", {255, 0, 0}, "Your hands are up.")
			end
		else
			TriggerEvent("chatMessage", "You are handcuffed..")
		end
	end
end)
--]]

--[[---------------------]]--

--[[ Other Functions ]]--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			SetPedPathCanUseLadders(GetPlayerPed(PlayerId()), false)
		end

		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@mugging3", "handsup_standing_base", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
		end
	end
end)

--]]

--HandCuff End

--Model Load Cuff

local handcuffconfig = {
	model = "prop_cs_cuffs_01",
	handcuffs = nil
}

-- Model Load Cuff End

--GunHolster start

--AddEventHandler("chatMessage", function(p, color, msg)
--    if msg:sub(1, 1) == "/" then
--        fullcmd = stringSplit(msg, " ")
--        cmd = fullcmd[1]
--
  --   	if cmd == "/h" then
    --    	TriggerClientEvent("Holster", p)
      --  	CancelEvent()
        --end
	--end
---end)

function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'Holster' )
AddEventHandler( 'Holster', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "move_m@intimidation@cop@unarmed" )
        if ( IsEntityPlayingAnim( ped, "move_m@intimidation@cop@unarmed", "idle", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "move_m@intimidation@cop@unarmed", "idle", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetEnableHandcuffs(ped, true)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "move_m@intimidation@cop@unarmed", "idle", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

--GunHolster End

--Hand on radio start--

AddEventHandler("chatMessage", function(p, color, msg)
    if msg:sub(1, 1) == "/" then
        fullcmd = stringSplit(msg, " ")
        cmd = fullcmd[1]

     	if cmd == "/r" then
        	TriggerClientEvent("Radio", p)
        	CancelEvent()
        end
		
     	if cmd == "/rg" then
        	TriggerClientEvent("RadioGunPoint", p)
        	CancelEvent()
        end
	end
end)

function stringSplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end


function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'Radio' )
AddEventHandler( 'Radio', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "random@arrests" )
        if ( IsEntityPlayingAnim( ped, "random@arrests", "generic_radio_chatter", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetEnableHandcuffs(ped, true)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_chatter", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'RadioGunPoint' )
AddEventHandler( 'RadioGunPoint', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "random@arrests" )
        if ( IsEntityPlayingAnim( ped, "random@arrests", "radio_chatter", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_PISTOL"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

--hand on radio end--

--drag start--

RegisterNetEvent('Cuff_close:getDrag')
AddEventHandler('Cuff_close:getDrag', function()

	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("Cuff_close:getDragServer", GetPlayerServerId(t))
	else
		 drawNotification("no ped close on you")
	end

end)

RegisterNetEvent('Cuff_close:toggleDrag')
AddEventHandler('Cuff_close:toggleDrag', function(t)
	if(handCuffed) then
		drag = not drag
		officerDrag = t
	end
end)

if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(officerDrag))
			local myped = GetPlayerPed(-1)
			AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			playerStillDragged = true
		else
			if(playerStillDragged) then
				DetachEntity(GetPlayerPed(-1), true, false)
				playerStillDragged = false
			end
		end
end
end)

Citizen.CreateThread(function()
	while true do
		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(playerPedDragged))
			plyPos = GetEntityCoords(ped,  true)
			SetEntityCoords(ped, plyPos.x, plyPos.y, plyPos.z)    
		end
		Citizen.Wait(1000)
	end
end)

function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end
-- drag end --

-- seat start --

RegisterNetEvent('seat')
AddEventHandler('seat', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		TriggerServerEvent("seat", GetPlayerServerId(t), v)
	else
		drawNotification("no ped close to you")
	end
end)

RegisterNetEvent('seat')
AddEventHandler('seat', function(veh)
	if(handCuffed) then
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			SetPedIntoVehicle(GetPlayerPed(-1), vehicleHandle, 1)
		end
	end
end)

-- seat end --

-- unseat start --

RegisterNetEvent('unseat')
AddEventHandler('unseat', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("Cuff_close:getUnseatServer", GetPlayerServerId(t))
	else
		drawNotification("no ped close to you")
	end
end)

RegisterNetEvent('unseat')
AddEventHandler('unseat', function(t)
	local ped = GetPlayerPed(t)        
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2
   
	SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

-- unseat end --

--roll windows --

local windowup = true
RegisterNetEvent("RollWindow")
AddEventHandler('RollWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 0)
				RollDownWindow(playerCar, 1)
				TriggerEvent('chatMessage', '', {255,0,0}, 'Windows down')
				windowup = false
			else
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				TriggerEvent('chatMessage', '', {255,0,0}, 'Windows up')
				windowup = true
			end
		end
	end
end )

RegisterCommand("rollw", function(source, args, raw)
    TriggerEvent("RollWindow")
end, false) --False, allow everyone to run it(thnx @Havoc)


-- end roll windows --

------------------------
local handCuffed = false
local drag = false
local playerStillDragged = false
local officerDrag = -1



-----------------------------------------------------------------------------------------------------

RegisterNetEvent('Cuff_close:getcuff')
AddEventHandler('Cuff_close:getcuff', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("Cuff_close:getCuffServer", GetPlayerServerId(t))
	else
		drawNotification("no ped close to you")
	end
end)

RegisterNetEvent('Cuff_close:getDrag')
AddEventHandler('Cuff_close:getDrag', function()

	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("Cuff_close:getDragServer", GetPlayerServerId(t))
	else
		 drawNotification("no ped close on you")
	end

end)

RegisterNetEvent('Cuff_close:getUnseatVehicle')
AddEventHandler('Cuff_close:getUnseatVehicle', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("Cuff_close:getUnseatServer", GetPlayerServerId(t))
	else
		drawNotification("no ped close on you")
	end
end)

RegisterNetEvent('Cuff_close:getSeatedVehicle')
AddEventHandler('Cuff_close:getSeatedVehicle', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		TriggerServerEvent("Cuff_close:getSeatedServer", GetPlayerServerId(t), v)
	else
		drawNotification("no ped close on you")
	end
end)



----------------------------------------------------------------------------------------------------

RegisterNetEvent('Cuff_close:getArrested')
AddEventHandler('Cuff_close:getArrested', function()
	handCuffed = not handCuffed
	if(handCuffed) then
		drawNotification("you are been cuffed")
	else
		drawNotification("you are been uncuffed")
	end
end)

RegisterNetEvent('Cuff_close:toggleDrag')
AddEventHandler('Cuff_close:toggleDrag', function(t)
	if(handCuffed) then
		drag = not drag
		officerDrag = t
	end
end)

RegisterNetEvent('Cuff_close:forcedEnteringVeh')
AddEventHandler('Cuff_close:forcedEnteringVeh', function(veh)
	if(handCuffed) then
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			SetPedIntoVehicle(GetPlayerPed(-1), vehicleHandle, 1)
		end
	end
end)


RegisterNetEvent('Cuff_close:unseatme')
AddEventHandler('Cuff_close:unseatme', function(t)
	local ped = GetPlayerPed(t)        
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2
   
	SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		
				
		if (handCuffed) then
			RequestAnimDict('mp_arresting')

			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(0)
			end

			local myPed = PlayerPedId(-1)
			local animation = 'idle'
			local flags = 16
			
			while(IsPedBeingStunned(myPed, 0)) do
				ClearPedTasksImmediately(myPed)
			end
			TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)
		end

		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(officerDrag))
			local myped = GetPlayerPed(-1)
			AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			playerStillDragged = true
		else
			if(playerStillDragged) then
				DetachEntity(GetPlayerPed(-1), true, false)
				playerStillDragged = false
			end
		end
end
end)

Citizen.CreateThread(function()
	while true do
		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(playerPedDragged))
			plyPos = GetEntityCoords(ped,  true)
			SetEntityCoords(ped, plyPos.x, plyPos.y, plyPos.z)    
		end
		Citizen.Wait(1000)
	end
end)



function GetPlayers()
    local players = {}

    for i = 0, 31 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

------

local CurrentVersion = '2.2.0'

AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/engine") then
		TriggerClientEvent('EngineToggle:Engine', source)
		CancelEvent()
	end
end)

PerformHttpRequest("https://raw.githubusercontent.com/Flatracer/EngineToggle_Resources/master/VERSION", function(Error, NewestVersion, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/Flatracer/EngineToggle_Resources/master/CHANGES', function(Error, Changes, Header)
		print('\n')
		print('####################################################################')
		print("########################## Engine Toggle ###########################")
		print('####################################################################')
		print('#####                  Current Version: ' .. CurrentVersion .. '                  #####')
		print('#####                   Newest Version: ' .. NewestVersion .. '                  #####')
		print('####################################################################')
		if CurrentVersion ~= NewestVersion then
			print('##### Outdated, please check the Topic for the newest Version! #####')
			print('####################################################################')
			print('CHANGES:\n' .. Changes)
		else
			print('#####                        Up to date!                       #####')
			print('####################################################################')
		end
		print('\n')
	end)
end)
------- server --

-- client-- 

-- CLIENTSIDED

-- Registers a network event
RegisterNetEvent('EngineToggle:Engine')
RegisterNetEvent('EngineToggle:RPDamage')

local vehicles = {}; RPWorking = true

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))) then
			table.insert(vehicles, {GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)), IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))})
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), false) and not table.contains(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
			table.insert(vehicles, {GetVehiclePedIsIn(GetPlayerPed(-1), false), IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))})
		end
		for i, vehicle in ipairs(vehicles) do
			if DoesEntityExist(vehicle[1]) then
				if (GetPedInVehicleSeat(vehicle[1], -1) == GetPlayerPed(-1)) or IsVehicleSeatFree(vehicle[1], -1) then
					if RPWorking then
						SetVehicleEngineOn(vehicle[1], vehicle[2], true, false)
						SetVehicleJetEngineOn(vehicle[1], vehicle[2])
						if not IsPedInAnyVehicle(GetPlayerPed(-1), false) or (IsPedInAnyVehicle(GetPlayerPed(-1), false) and vehicle[1]~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
							if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
								if vehicle[2] then
									SetHeliBladesFullSpeed(vehicle[1])
								end
							end
						end
					end
				end
			else
				table.remove(vehicles, i)
			end
		end
	end
end)

AddEventHandler('EngineToggle:Engine', function()
	local veh
	local StateIndex
	for i, vehicle in ipairs(vehicles) do
		if vehicle[1] == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
			veh = vehicle[1]
			StateIndex = i
		end
	end
	Citizen.Wait(1500)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then 
		if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
			vehicles[StateIndex][2] = not GetIsVehicleEngineRunning(veh)
			if vehicles[StateIndex][2] then
				TriggerEvent('chatMessage', '', {0, 255, 0}, 'Engine turned ON!')
			else
				TriggerEvent('chatMessage', '', {255, 0, 0}, 'Engine turned OFF!')
			end
		end 
    end 
end)

AddEventHandler('EngineToggle:RPDamage', function(State)
	RPWorking = State
end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end
--