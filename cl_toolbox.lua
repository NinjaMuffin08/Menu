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

   -- [Civ Toolbox]

	if ( data == "hands" ) then 
		TriggerEvent( 'Handsup' )
	elseif ( data == "kneel" ) then 
		TriggerEvent( 'KneelHU')

   -- [Civ Toolbox]

   -- [LEO Toolbox]
	elseif ( data == "cuff") then
		cuff()
	elseif ( data == "drag") then
		ToggleActionMenu()
		return
		DragPlayer()
	elseif ( data == "seat") then
		ToggleActionMenu()
		return
		PutInVehicle()
	elseif ( data == "unseat") then
		ToggleActionMenu()
		return
		UnseatVehicle()
	elseif ( data == "radar" ) then 
        TriggerEvent( 'wk:radarRC' )
	elseif ( data == "radio" ) then
	    TriggerEvent( 'Radio' )
	elseif ( data == "spikes1" ) then 
	    TriggerEvent( 'dspikes' )
	elseif ( data == "dropweap") then
    ToggleActionMenu()
		return
		     dropweap()
	-- [LEO Toolbox]
	
	elseif ( data == "breath" ) then
		TriggerEvent( "breath" )
	elseif ( data == "setbac" ) then 
		TriggerEvent( "/bacset" )

	

  -- [Vehicle]
    	
	elseif ( data == "engine" ) then 
		EngineToggle()
	elseif ( data == "trunk" ) then 
		TriggerEvent( "openTrunk" )
	elseif ( data == "hood" ) then 
		TriggerEvent( "openHood" )
	elseif ( data == "fleft" ) then 
		TriggerEvent( "frontLeft" )
	elseif ( data == "fright" ) then 
		TriggerEvent( "frontRight" )
	elseif ( data == "rleft" ) then 
		TriggerEvent( "rearLeft" )
	elseif ( data == "rright" ) then
		TriggerEvent( "rearRight" )
	elseif ( data == "fwindows" ) then 
		TriggerEvent( "frontWindow" )
	elseif ( data == "rwindows" ) then 
		TriggerEvent( "rearWindow" )
	elseif ( data == "delete" ) then
	    TriggerEvent( 'wk:deleteVehicle' )

  -- [Vehicle]
  
  

	elseif ( data == "wl9" ) then 
		TriggerEvent( "wl9" )
	elseif ( data == "wl10" ) then 
		TriggerEvent( "wl10" )
	elseif ( data == "wl11" ) then 
		TriggerEvent( "wl11" )
	elseif ( data == "wl12" ) then 
		TriggerEvent( "wl12" )
	elseif ( data == "wl13" ) then 
		TriggerEvent( "wl13" )
	elseif ( data == "at8" ) then
		TriggerEvent( "at8" )
	elseif ( data == "at9" ) then 
		TriggerEvent( "at9" )
	elseif ( data == "wl15" ) then 
		TriggerEvent( "wl15" )
	elseif ( data == "wl6" ) then 
		TriggerEvent( "wl6" )
	elseif ( data == "wl17" ) then 
		TriggerEvent( "wl17" )
	elseif ( data == "wl18" ) then 
		TriggerEvent( "wl18" )
	elseif ( data == "wl19" ) then 
		TriggerEvent( "wl19" )
	elseif ( data == "wl20" ) then 
		TriggerEvent( "wl20" )
	elseif ( data == "wl21" ) then
		TriggerEvent( "wl21" )
	elseif ( data == "wl22" ) then 
		TriggerEvent( "wl22" )
	elseif ( data == "gc25" ) then 
		TriggerEvent( "gc25" )
	elseif ( data == "gc26" ) then 
		TriggerEvent( "gc26" )
	elseif ( data == "gc27" ) then 
		TriggerEvent( "gc27" )
	elseif ( data == "gc28" ) then 
		TriggerEvent( "gc28" )
	elseif ( data == "qz28" ) then 
		TriggerEvent( "qz28" )
	elseif ( data == "qz29" ) then 
		TriggerEvent( "qz29" )
	elseif ( data == "qz30" ) then
		TriggerEvent( "qz30" )
	elseif ( data == "vg18" ) then 
		TriggerEvent( "vg18" )
	elseif ( data == "vg19" ) then 
		TriggerEvent( "vg19" )
	elseif ( data == "vg57" ) then 
		TriggerEvent( "vg57" )
	elseif ( data == "wf9" ) then 
		TriggerEvent( "wf9" )
	elseif ( data == "wf10" ) then 
		TriggerEvent( "wf10" )
	elseif ( data == "wf11" ) then 
		TriggerEvent( "wf11" )
	elseif ( data == "wf12" ) then 
		TriggerEvent( "wf12" )
	elseif ( data == "wf13" ) then
		TriggerEvent( "wf13" )
	elseif ( data == "wf14" ) then 
		TriggerEvent( "wf14" )
	elseif ( data == "wf15" ) then 
		TriggerEvent( "wf15" )
	elseif ( data == "wf16" ) then 
		TriggerEvent( "wf16" )
	elseif ( data == "wf20" ) then 
		TriggerEvent( "wf20" )
	elseif ( data == "wf21" ) then 
		TriggerEvent( "wf21" )
	elseif ( data == "at8" ) then 
		TriggerEvent( "at8" )
	elseif ( data == "at9" ) then 
		TriggerEvent( "at9" )
	elseif ( data == "at10" ) then 
		TriggerEvent( "at10" )
	elseif ( data == "at11" ) then
		TriggerEvent( "at11" )
	elseif ( data == "at12" ) then 
		TriggerEvent( "at12" )
	elseif ( data == "at13" ) then 
		TriggerEvent( "at13" )
	elseif ( data == "at14" ) then 
		TriggerEvent( "at14" )
	elseif ( data == "at15" ) then 
		TriggerEvent( "at15" )
	elseif ( data == "qt20" ) then 
		TriggerEvent( "qt20" )
	elseif ( data == "qt21" ) then 
		TriggerEvent( "qt21" )
	elseif ( data == "qt22" ) then 
		TriggerEvent( "qt22" )
	elseif ( data == "w71p1" ) then
		TriggerEvent( "w71p1" )
	elseif ( data == "w71p2" ) then 
		TriggerEvent( "w71p2" )
	elseif ( data == "w71p3" ) then 
		TriggerEvent( "w71p3" )	
	elseif ( data == "350" ) then 
		TriggerEvent( "350" )
	elseif ( data == "4220" ) then
		TriggerEvent( "4220" )
	elseif ( data == "4221" ) then 
		TriggerEvent( "4221" )
	elseif ( data == "helimed1" ) then 
		TriggerEvent( "helimed1" )	
	elseif ( data == "india99" ) then 
		TriggerEvent( "india99" )		
	elseif ( data == "delete" ) then
	    TriggerEvent( 'wk:deleteVehicle' )
  
  

   -- [Adverts]

   elseif ( data == "ad1" ) then 
		TriggerEvent( "ad1" )
	elseif ( data == "ad2" ) then 
		TriggerEvent( "ad2" )
	elseif ( data == "ad3" ) then 
		TriggerEvent( "ad3" )
	elseif ( data == "ad4" ) then 
		TriggerEvent( "ad4" )
	elseif ( data == "ad5" ) then 
		TriggerEvent( "ad5" )
	elseif ( data == "ad6" ) then 
		TriggerEvent( "ad6" )
	elseif ( data == "ad7" ) then 
		TriggerEvent( "ad7" )
	elseif ( data == "ad8" ) then 
		TriggerEvent( "ad8" )
	elseif ( data == "ad9" ) then 
		TriggerEvent( "ad9" )
	elseif ( data == "ad10" ) then 
		TriggerEvent( "ad10" )
	elseif ( data == "ad11" ) then 
		TriggerEvent( "ad11" )
	elseif ( data == "ad12" ) then 
		TriggerEvent( "ad12" )
	elseif ( data == "ad13" ) then 
		TriggerEvent( "ad13" )
	elseif ( data == "ad14" ) then 
		TriggerEvent( "ad14" )
	elseif ( data == "ad15" ) then 
		TriggerEvent( "ad15" )
	elseif ( data == "ad16" ) then 
		TriggerEvent( "ad16" )
	elseif ( data == "ad17" ) then 
		TriggerEvent( "ad17" )
	elseif ( data == "ad18" ) then 
		TriggerEvent( "ad18" )
	elseif ( data == "ad19" ) then 
		TriggerEvent( "ad19" )
	elseif ( data == "ad20" ) then 
		TriggerEvent( "ad20" )
	elseif ( data == "ad21" ) then 
		TriggerEvent( "ad21" )
    
   -- [Adverts]

   -- [Emotes]

    elseif ( data == "radiogun" ) then 
		TriggerEvent( "RadioGunPoint" )
	elseif ( data == "stance" ) then 
		TriggerEvent( "Stance" )
	elseif ( data == "investigate" ) then 
		TriggerEvent( "Investigate" )
	elseif ( data == "holster" ) then 
	    TriggerEvent( 'Holster' )
    elseif ( data == "citation" ) then 
	    TriggerEvent( 'Citation' )
	elseif ( data == "notes" ) then 
	    TriggerEvent( 'Notes' )
	elseif ( data == "traffic" ) then 
	    TriggerEvent( 'Traffic' )
	elseif ( data == "medic" ) then 
	    TriggerEvent( 'Medic' )
	elseif ( data == "weld" ) then 
	    TriggerEvent( 'Weld' )
	elseif ( data == "smoke" ) then 
	    TriggerEvent( 'Smoke' )
	elseif ( data == "party" ) then 
	    TriggerEvent( 'Party' )
	elseif ( data == "drink" ) then 
	    TriggerEvent( 'Drink' )
	elseif ( data == "pushups" ) then 
	    TriggerEvent( 'Pushups' )
	elseif ( data == "phone" ) then 
	    TriggerEvent( 'Phone' )
	elseif ( data == "injured" ) then 
	    TriggerEvent( 'Injured' )
	elseif ( data == "weed" ) then 
	    TriggerEvent( 'Weed' )
	elseif ( data == "coffee" ) then 
	    TriggerEvent( 'Coffee' )
	elseif ( data == "photo" ) then 
	    TriggerEvent( 'Photo' )
	elseif ( data == "binoculars" ) then 
	    TriggerEvent( 'Binoculars' )
	elseif ( data == "situps" ) then 
	    TriggerEvent( 'Situps' )
	elseif ( data == "film" ) then 
	    TriggerEvent( 'Film' )
	elseif ( data == "weights" ) then 
	    TriggerEvent( 'Weights' )
	elseif ( data == "flex" ) then 
	    TriggerEvent( 'Flex' )
	elseif ( data == "cancel" ) then 
	    TriggerEvent( 'cancelEmote' )

   -- [Emotes]
   
   
   	elseif ( data == "spike" ) then 
	    TriggerEvent( 'c_setSpike' )
   	elseif ( data == "spike1" ) then 
	    TriggerEvent( 'c_deleteSpike' )
	elseif ( data == "cone2" ) then
		TriggerEvent( 'cone2' )
	elseif ( data == "cone2r" ) then
		TriggerEvent( 'cone2r' )
	elseif ( data == "barrier" ) then
		TriggerEvent( 'barrier' )
	elseif ( data == "barrier_rem" ) then
		TriggerEvent( 'barrier_rem' )
   

   -- [Outfits]

    elseif ( data == "area" ) then 
		TriggerEvent( "lspdOutfit" )
    elseif ( data == "traffic1" ) then 
		TriggerEvent( "bcsoOutfit" )
    elseif ( data == "support" ) then 
		TriggerEvent( "sahpOutfit" )
	elseif ( data == "sfo" ) then 
		TriggerEvent( "sahpOutfit12" )
	elseif ( data == "brit" ) then 
		TriggerEvent( "lspdOutfit1" )
    elseif ( data == "fire" ) then 
		TriggerEvent( "fireOutfit" )
	elseif ( data == "medicoutfit" ) then 
		TriggerEvent( "medicOutfit" )

	elseif ( data == "exit" ) then 
		-- We toggle the ActionMenu and return here, otherwise the function 
		-- call below would be executed too, which would just open the menu again 
		ToggleActionMenu()
		return 
	end 

	-- This will only be called if any button other than the exit button is pressed
--	ToggleActionMenu() Uncomment this if you want the menu to close, after selecting an option.
end )


--[[------------------------------------------------------------------------
	ActionMenu Control and Input Blocking 
	This is the main while loop that opens the ActionMenu on keypress. It 
	uses the input blocking found in the ES Banking resource, credits to 
	the authors.
------------------------------------------------------------------------]]--
RegisterNetEvent('/bacset')
TriggerEvent( '/bacset' )
bac = {}
AddEventHandler('chatMessage', function(source, color, message) --Commands
  local args = stringsplit(message, " ")
  if (args[1] == "/bacset") then
    CancelEvent()

    if (args[2] ~= nil) then
	  bac[source] = args[2]
	  TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "BAC set to: "..bac[source])
    else
      TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Usage: /bacset [number]")
    end
  end
  
  
if args[1] == "/bactest" then
	CancelEvent()
	if args[2] ~= nil then
		if (tonumber(args[2]) ~= nil) then
		  if (bac[tonumber(args[2])] ~= nil) then
		    TriggerClientEvent("chatMessage", source, "Breathalyzer", {47, 121, 239}, "This users BAC is: "..bac[tonumber(args[2])])
		  else
		    TriggerClientEvent("chatMessage", source, "Breathalyzer", {47, 121, 239}, "This user does not have a BAC set.")
		  end
		else
			TriggerClientEvent("chatMessage", source, "Breathalyzer", {47, 121, 239}, "Usage: /bactest [player id]")
		end
	else
		TriggerClientEvent("chatMessage", source, "Breathalyzer", {47, 121, 239}, "Usage: /bactest [player id]")
	end
end
  
  if (args[1] == "/bacclear") then
    CancelEvent()
	bac[source] = nil
	TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Your BAC has been reset")
  end
  
  -- "Administrator" commands below here
  
  if (args[1] == "/bacclearall") then
    CancelEvent()
	if (args[2] ~= nil) then
	  if (args[2] == mpass) then
	    bac = {}
		TriggerClientEvent('chatMessage', -1, "Breathalyzer", {47, 121, 239}, "All BAC's have been reset")
      else
	    TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Incorrect password")
	  end
	else
	  TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Usage: /bacclearall [password]")
	end
  end
  
  if (args[1] == "/bacclearone") then
    CancelEvent()
	if (args[3] ~= nil) then
	  if (tonumber(args[2]) ~= nil) then
	    if (args[3] == mpass) then
	      bac[tonumber(args[2])] = nil
	  	  TriggerClientEvent('chatMessage', -1, "Breathalyzer", {47, 121, 239}, "Playerid "..args[2].."'s BAC has been cleared")
        else
	      TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Incorrect password")
	    end
	  else
	    TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Usage: /bacclearone [id] [password]")
      end
	else
	  TriggerClientEvent('chatMessage', source, "Breathalyzer", {47, 121, 239}, "Usage: /bacclearone [id] [password]")
	end
  end
end)

AddEventHandler('playerDropped', function() -- upon player leaving
  bac[source] = nil
  print("The playerid "..source.."'s BAC has been reset automatically")
end)

function stringsplit(inputstr, sep)
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







RegisterNetEvent('wl9')
TriggerEvent( 'wl9' )
AddEventHandler('wl9', function()
local hash = GetHashKey("wl9")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl10')
TriggerEvent( 'wl10' )
AddEventHandler('wl10', function()
local hash = GetHashKey("wl10")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl11')
TriggerEvent( 'wl11' )
AddEventHandler('wl11', function()
local hash = GetHashKey("wl11")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl12')
TriggerEvent( 'wl12' )
AddEventHandler('wl12', function()
local hash = GetHashKey("wl12")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl13')
TriggerEvent( 'wl13' )
AddEventHandler('wl13', function()
local hash = GetHashKey("wl13")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl14')
TriggerEvent( 'wl14' )
AddEventHandler('wl14', function()
local hash = GetHashKey("wll14")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl15')
TriggerEvent( 'wl15' )
AddEventHandler('wl15', function()
local hash = GetHashKey("wl15")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl16')
TriggerEvent( 'wl16' )
AddEventHandler('wl16', function()
local hash = GetHashKey("wl16")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl17')
TriggerEvent( 'wl17' )
AddEventHandler('wl17', function()
local hash = GetHashKey("wl17")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl18')
TriggerEvent( 'wl18' )
AddEventHandler('wl18', function()
local hash = GetHashKey("wl18")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl19')
TriggerEvent( 'wl19' )
AddEventHandler('wl19', function()
local hash = GetHashKey("wl19")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl20')
TriggerEvent( 'wl20' )
AddEventHandler('wl20', function()
local hash = GetHashKey("wl20")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wl21')
TriggerEvent( 'wl21' )
AddEventHandler('wl21', function()
local hash = GetHashKey("wl21")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('gc25')
TriggerEvent( 'gc25' )
AddEventHandler('gc25', function()
local hash = GetHashKey("gc25")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('gc26')
TriggerEvent( 'gc26' )
AddEventHandler('gc26', function()
local hash = GetHashKey("gc26")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('gc27')
TriggerEvent( 'gc27' )
AddEventHandler('gc27', function()
local hash = GetHashKey("gc27")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('gc28')
TriggerEvent( 'gc28' )
AddEventHandler('gc28', function()
local hash = GetHashKey("gc28")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('qz28')
TriggerEvent( 'qz28' )
AddEventHandler('qz28', function()
local hash = GetHashKey("qz28")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('qz29')
TriggerEvent( 'qz29' )
AddEventHandler('qz29', function()
local hash = GetHashKey("qz29")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('qz30')
TriggerEvent( 'qz30' )
AddEventHandler('qz30', function()
local hash = GetHashKey("qz30")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('vg18')
TriggerEvent( 'vg18' )
AddEventHandler('vg18', function()
local hash = GetHashKey("vg18")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('vg19')
TriggerEvent( 'vg19' )
AddEventHandler('vg19', function()
local hash = GetHashKey("vg19")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('vg57')
TriggerEvent( 'vg57' )
AddEventHandler('vg57', function()
local hash = GetHashKey("vg57")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf9')
TriggerEvent( 'wf9' )
AddEventHandler('wf9', function()
local hash = GetHashKey("wf9")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf10')
TriggerEvent( 'wf10' )
AddEventHandler('wf10', function()
local hash = GetHashKey("wf10")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf11')
TriggerEvent( 'wf11' )
AddEventHandler('wf11', function()
local hash = GetHashKey("wf11")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf12')
TriggerEvent( 'wf12' )
AddEventHandler('wf12', function()
local hash = GetHashKey("wf12")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf13')
TriggerEvent( 'wf13' )
AddEventHandler('wf13', function()
local hash = GetHashKey("wf13")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf14')
TriggerEvent( 'wf14' )
AddEventHandler('wf14', function()
local hash = GetHashKey("wf14")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf15')
TriggerEvent( 'wf15' )
AddEventHandler('wf15', function()
local hash = GetHashKey("wf15")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf16')
TriggerEvent( 'wf16' )
AddEventHandler('wf16', function()
local hash = GetHashKey("wf16")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf20')
TriggerEvent( 'wf20' )
AddEventHandler('wf20', function()
local hash = GetHashKey("wf20")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('wf21')
TriggerEvent( 'wf21' )
AddEventHandler('wf21', function()
local hash = GetHashKey("wf21")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at8')
TriggerEvent( 'at8' )
AddEventHandler('at8', function()
local hash = GetHashKey("at8")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at9')
TriggerEvent( 'at9' )
AddEventHandler('at9', function()
local hash = GetHashKey("at9")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at10')
TriggerEvent( 'at10' )
AddEventHandler('at10', function()
local hash = GetHashKey("at10")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at11')
TriggerEvent( 'at11' )
AddEventHandler('at11', function()
local hash = GetHashKey("at11")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at12')
TriggerEvent( 'at12' )
AddEventHandler('at12', function()
local hash = GetHashKey("at12")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at13')
TriggerEvent( 'at13' )
AddEventHandler('at13', function()
local hash = GetHashKey("at13")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at14')
TriggerEvent( 'at14' )
AddEventHandler('at14', function()
local hash = GetHashKey("at14")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at15')
TriggerEvent( 'at15' )
AddEventHandler('at15', function()
local hash = GetHashKey("at15")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('at16')
TriggerEvent( 'at16' )
AddEventHandler('at16', function()
local hash = GetHashKey("at16")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('qt20')
TriggerEvent( 'qt20' )
AddEventHandler('qt20', function()
local hash = GetHashKey("qt20")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('qt21')
TriggerEvent( 'qt21' )
AddEventHandler('qt21', function()
local hash = GetHashKey("qt21")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('qt22')
TriggerEvent( 'qt22' )
AddEventHandler('qt22', function()
local hash = GetHashKey("qt22")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('w71p1')
TriggerEvent( 'w71p1' )
AddEventHandler('w71p1', function()
local hash = GetHashKey("w71p1")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('w71p2')
TriggerEvent( 'w71p2' )
AddEventHandler('w71p2', function()
local hash = GetHashKey("w71p2")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('w71p3')
TriggerEvent( 'w71p3' )
AddEventHandler('w71p3', function()
local hash = GetHashKey("w71p3")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('350')
TriggerEvent( '350' )
AddEventHandler('350', function()
local hash = GetHashKey("350")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('4220')
TriggerEvent( '4220' )
AddEventHandler('4220', function()
local hash = GetHashKey("4220")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('4221')
TriggerEvent( '4221' )
AddEventHandler('4221', function()
local hash = GetHashKey("4221")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('helimed1')
TriggerEvent( 'helimed1' )
AddEventHandler('helimed1', function()
local hash = GetHashKey("helimed1")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('india99')
TriggerEvent( 'india99' )
AddEventHandler('india99', function()
local hash = GetHashKey("india99")

RequestModel(hash)

while not HasModelLoaded(hash) do
RequestModel(hash)
Citizen.Wait(0)
end

local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

RegisterNetEvent('cone2')
AddEventHandler('cone2', function()
    cone2()
end)

RegisterNetEvent('cone2r')
AddEventHandler('cone2r', function()
    Removecone2()
end)

RegisterNetEvent('barrier')
AddEventHandler('barrier', function()
    barrier()
end)

RegisterNetEvent('barrier_rem')
AddEventHandler('barrier_rem', function()
    Removebarrier()
end)


--[[function cone2()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_mp_cone_01')
	
	while not HasModelLoaded('prop_mp_cone_01') do
		Citizen.Wait(1)
	end
	
	local cone2 = CreateObject(GetHashKey("prop_mp_cone_01"), x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(cone, heading)
	notification('~g~The cone has been placed!')
end--]]

function cone2()
		local pP = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(pP, true))
		local heading = GetEntityHeading(pP)
		local cone2 = CreateObject(GetHashKey('prop_mp_cone_01'), x, y, z-2, true, true, true)
		PlaceObjectOnGroundProperly(cone2)
		SetEntityHeading(cone2, heading)
	notification('~g~The cone has been placed!')
end

function Removecone2()
   local ped = GetPlayerPed(-1)
   local veh = GetVehiclePedIsIn(ped, false)
   local vehCoord = GetEntityCoords(ped)
   if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("prop_mp_cone_01"), true) then
    local  cone2 = GetClosestObjectOfType(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("prop_mp_cone_01"), false, false, false)
      SetEntityAsMissionEntity(cone2, true, true)
      DeleteObject(cone2)
	  notification('~r~The cone has been Removed!')
   end
end	

--[[function Removecone2()
   local ped = GetPlayerPed(-1)
   local veh = GetVehiclePedIsIn(ped, false)
   local vehCoord = GetEntityCoords(ped)
   if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("prop_mp_cone_01"), true) then
local  cone2 = GetClosestObjectOfType(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("prop_mp_cone_01"), false, false, false)
      SetEntityAsMissionEntity(cone2, true, true)
      DeleteObject(cone2)
	  notification('~g~The cone has been Removed!')
   end
end	--]]


function barrier()
		local pP = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(pP, true))
		local heading = GetEntityHeading(pP)
		local barrier = CreateObject(GetHashKey('prop_barrier_work05'), x, y, z-2, true, true, true)
		PlaceObjectOnGroundProperly(barrier)
		SetEntityHeading(barrier, heading)
	notification('~g~The barrier has been placed!')
end

function Removebarrier()
   local ped = GetPlayerPed(-1)
   local veh = GetVehiclePedIsIn(ped, false)
   local vehCoord = GetEntityCoords(ped)
   if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("prop_barrier_work05"), true) then
local  barrier = GetClosestObjectOfType(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("prop_barrier_work05"), false, false, false)
      SetEntityAsMissionEntity(barrier, true, true)
      DeleteObject(barrier)
	  notification('~r~The Barrier has been Removed!')
   end
end	

AddEventHandler('murtaza:cone', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_mp_cone_01')
	
	while not HasModelLoaded('prop_mp_cone_01') do
		Citizen.Wait(1)
	end
	
	local cone = CreateObject('prop_mp_cone_01', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(cone)
	SetEntityHeading(cone, heading)
	notification('~g~The cone has been placed!')
end)

AddEventHandler('murtaza:consign1', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_consign_01a')
	
	while not HasModelLoaded('prop_consign_01a') do
		Citizen.Wait(1)
	end
	local cone = CreateObject('prop_consign_01a', x, y, z-1, true, true, true)
	PlaceObjectOnGroundProperly(consign1)
	SetEntityHeading(consign1, heading)
	notification('~g~The sign has been placed!')
end)

AddEventHandler('murtaza:barrier2', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_barrier_work01a')
	
	while not HasModelLoaded('prop_barrier_work01a') do
		Citizen.Wait(1)
	end
	
	local barrier2 = CreateObject('prop_barrier_work01a', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(barrier2)
	SetEntityHeading(barrier2, heading)
	notification('~g~The barrier has been placed!')
end)

AddEventHandler('murtaza:sbarrier', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_mp_barrier_02b')
	
	while not HasModelLoaded('prop_mp_barrier_02b') do
		Citizen.Wait(1)
	end
	
	local sbarrier = CreateObject('prop_mp_barrier_02b', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(sbarrier)
	SetEntityHeading(sbarrier, heading)
	notification('~g~The small barrier has been placed!')
end)

AddEventHandler('murtaza:barrier3', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_barrier_06a')
	
	while not HasModelLoaded('prop_barrier_work06a') do
		Citizen.Wait(1)
	end
	
	local sbarrier = CreateObject('prop_barrier_work06a', x, y, z-1, true, true, true)
	PlaceObjectOnGroundProperly(barrier3)
	SetEntityHeading(barrier3, heading)
	notification('~g~The barrier has been placed!')
end)

AddEventHandler('murtaza:barrier', function()
	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
	local heading = GetEntityHeading(GetPlayerPed(-1))
	
	RequestModel('prop_barrier_work05')
	
	while not HasModelLoaded('prop_barrier_work05') do
		Citizen.Wait(1)
	end
	
	local barrier = CreateObject('prop_barrier_work05', x, y, z-2, true, true, true)
	PlaceObjectOnGroundProperly(barrier)
	SetEntityHeading(barrier, heading)
	notification('~g~The barrier has been placed!')
end)

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

RegisterNetEvent('c_setSpike')
AddEventHandler('c_setSpike', function()
    SetSpikesOnGround1()
end)

RegisterNetEvent('c_deleteSpike')
AddEventHandler('c_deleteSpike', function()
    RemoveSpikesOnGround2()
end)

function SetSpikesOnGround1()
		local pP = GetPlayerPed(-1)
		local x, y, z = table.unpack(GetEntityCoords(pP, true))
		local heading = GetEntityHeading(pP)
		local spike = CreateObject(GetHashKey('P_ld_stinger_s'), x, y, z-2, true, true, true)
	--	PlaceObjectOnGroundProperly(spike)
		SetEntityHeading(spike, heading)
	notification('~g~The Spikestrip has been placed!')
end

--[[function SetSpikesOnGround()
    x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))

    spike = GetHashKey("P_ld_stinger_s")

    RequestModel(spike)
    while not HasModelLoaded(spike) do
      Citizen.Wait(1)
    end

    local object = CreateObject(spike, x+1, y, z-2, true, true, false) -- x+1
    PlaceObjectOnGroundProperly(object)
end--]]

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    local vehCoord = GetEntityCoords(veh)
    if IsPedInAnyVehicle(ped, false) then
      if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), true) then
         SetVehicleTyreBurst(veh, 0, true, 1000.0)
         SetVehicleTyreBurst(veh, 1, true, 1000.0)
         SetVehicleTyreBurst(veh, 2, true, 1000.0)
         SetVehicleTyreBurst(veh, 3, true, 1000.0)
         SetVehicleTyreBurst(veh, 4, true, 1000.0)
         SetVehicleTyreBurst(veh, 5, true, 1000.0)
         SetVehicleTyreBurst(veh, 6, true, 1000.0)
         SetVehicleTyreBurst(veh, 7, true, 1000.0)
         RemoveSpike()
       end
     end
   end
end)

function RemoveSpike()
   local ped = GetPlayerPed(-1)
   local veh = GetVehiclePedIsIn(ped, false)
   local vehCoord = GetEntityCoords(veh)
   if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), true) then
      spike = GetClosestObjectOfType(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), false, false, false)
      SetEntityAsMissionEntity(spike, true, true)
      DeleteObject(spike)
   end
end

function RemoveSpikesOnGround2()
   local ped = GetPlayerPed(-1)
   local veh = GetVehiclePedIsIn(ped, false)
   local vehCoord = GetEntityCoords(ped)
   if DoesObjectOfTypeExistAtCoords(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), true) then
      spike = GetClosestObjectOfType(vehCoord["x"], vehCoord["y"], vehCoord["z"], 0.9, GetHashKey("P_ld_stinger_s"), false, false, false)
      SetEntityAsMissionEntity(spike, true, true)
      DeleteObject(spike)
	  notification('~r~The Spikestrip has been Removed!')
   end
end	




Citizen.CreateThread( function()
	-- This is just in case the resources restarted whilst the NUI is focused. 
	SetNuiFocus( false )

	while true do 
		-- Control ID 20 is the 'Z' key by default 
		-- Use https://wiki.fivem.net/wiki/Controls to find a different key 
		if ( IsControlJustReleased( 0, 48 ) or IsDisabledControlJustReleased( 0, 48 ) ) and GetLastInputMethod( 0 ) then 
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
	TriggerEvent( 'chatMessage', "Essex RolePlay", { 255, 25, 25 }, msg )
end

--Hands Up Start

RegisterNetEvent("Handsup")
AddEventHandler("Handsup", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("random@mugging3")
			while not HasAnimDictLoaded("random@mugging3") do
				Citizen.Wait(100)
			end
			
			if IsEntityPlayingAnim(lPed, "random@mugging3", "handsup_standing_base", 3) then
				ClearPedSecondaryTask(lPed)
				SetEnableHandcuffs(lPed, false)
			else
				TaskPlayAnim(lPed, "random@mugging3", "handsup_standing_base", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(lPed, true)
			end		
		end)
	end
end)

--Hands Up End

--Kneel Handsup Start
 
function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end
 
RegisterNetEvent( 'KneelHU' )
TriggerEvent( 'KneelHU' )
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

--Kneel Handsup End


function drawNotification(text) --Just Don't Edit!
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Front Windows Start

local windowup = true
RegisterNetEvent("frontWindow")
AddEventHandler('frontWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 0)
				RollDownWindow(playerCar, 1)
				drawNotification("You rolled down your front windows.")
				windowup = false
			else
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				drawNotification("You rolled up your front windows.")
				windowup = true
			end
		end
	end
end )

-- Front Windows End

-- Rear Windows Start

local windowup = true
RegisterNetEvent("rearWindow")
AddEventHandler('rearWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 2)
				RollDownWindow(playerCar, 3)
				drawNotification("~w~You rolled down your rear windows.")
				windowup = false
			else
				RollUpWindow(playerCar, 2)
				RollUpWindow(playerCar, 3)
				drawNotification("~w~You rolled up your rear windows.")
				windowup = true
			end
		end
	end
end )

-- Rear Windows End

--[LEO Animations Start]

-- Hand on Radio Start

RegisterNetEvent('Radio')
AddEventHandler('Radio', function()

local ped = GetPlayerPed( -1 )
    
if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "random@arrests" )
	   while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(ped)
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
				else
				TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
            end 
        end )
    end 
end )

-- Hand on Radio End

-- Hand on Radio W/ Gun Start

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

-- Hand on Radio W/ Gun End

-- LEO Stance Start

RegisterNetEvent('Stance')
AddEventHandler('Stance', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_COP_IDLES", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- LEO Stance End

-- Investigate Start

RegisterNetEvent('Investigate')
AddEventHandler('Investigate', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GUARD_STAND", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Investigate End

-- Holster Start

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

-- Holster End

-- Citation Start


RegisterNetEvent('Citation')
AddEventHandler('Citation', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Citation End

-- Take Notes Start


RegisterNetEvent('Notes')
AddEventHandler('Notes', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Take Notes End


-- Welding Start

RegisterNetEvent('Weld')
AddEventHandler('Weld', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Welding End

-- Direct Traffic Start


RegisterNetEvent('Traffic')
AddEventHandler('Traffic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Direct Traffic End

-- Medic Observe Start


RegisterNetEvent('Medic')
AddEventHandler('Medic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Medic Observe End

-- Cancel Emote

RegisterNetEvent( 'cancelEmote' )
AddEventHandler( 'cancelEmote', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
	    ClearPedSecondaryTask(ped)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)  
    end
end )

--[LEO Animations End]

-- Drop Weapon

function dropweap()
    local ped = PlayerPedId()
            local wep = GetSelectedPedWeapon(ped)
            SetPedDropsWeaponsWhenDead(ped, true)
            RequestAnimDict("mp_weapon_drop")
            if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) then -- INPUT_DROP_WEAPON (F7)
            TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
            SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			drawNotification("~w~You dropped your weapon.")
        end
end

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

-------------------------------------]

local handCuffed = false

local drag = false
local playerStillDragged = false
local officerDrag = -1

function cuff()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("wk_actionmenu:cuffGranted", GetPlayerServerId(t))
	else
	drawNotification("Cuffed player")
	end
end

--[[
function handcuff()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		if IsEntityPlayingAnim(lPed, "mp_arresting", "idle", 3) then
			ClearPedSecondaryTask(lPed)
			SetEnableHandcuffs(lPed, false)
			SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
			handcuff = false
		else
			RequestAnimDict("mp_arresting")
			while not HasAnimDictLoaded("mp_arresting") do
				Citizen.Wait(100)
			end

			TaskPlayAnim(lPed, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
			SetEnableHandcuffs(lPed, true)
			SetCurrentPedWeapon(lPed, GetHashKey("WEAPON_UNARMED"), true)
			handcuff = true
		end
	end
end)
--]]

RegisterNetEvent('wk_actionmenu:getArrested')
AddEventHandler('wk_actionmenu:getArrested', function()
	handCuffed = not handCuffed
	if(handCuffed) then
drawNotification("player cuffed")
	else
		drawNotification("Player uncuffed")
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
			local flags = 49
			
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

			RequestAnimDict('mp_arresting')

			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(0)
			end

			local myPed = PlayerPedId(-1)
			local animation = 'idle'
			local flags = 49
			
			while(IsPedBeingStunned(myPed, 0)) do
				ClearPedTasksImmediately(myPed)
			end
			TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)

		else
			if(playerStillDragged) then
				DetachEntity(GetPlayerPed(-1), true, false)
				playerStillDragged = false
			end
		end
end
end)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------



function DragPlayer()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("wk_actionmenu:dragRequest", GetPlayerServerId(t))
	else
		drawNotification("Dragging player")
	end
end


RegisterNetEvent('wk_actionmenu:toggleDrag')
AddEventHandler('wk_actionmenu:toggleDrag', function(t)

		drag = not drag
		officerDrag = t
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



-----------------------------------------------------------------------------------------------------------------------------------------------------------------



function PutInVehicle()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		TriggerServerEvent("wk_actionmenu:forceEnterAsk", GetPlayerServerId(t), v)
	else
		drawNotification("Put player in vehicle")
	end
end

RegisterNetEvent('wk_actionmenu:forcedEnteringVeh')
AddEventHandler('wk_actionmenu:forcedEnteringVeh', function(veh)
	
		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			SetPedIntoVehicle(GetPlayerPed(-1), vehicleHandle, 1)
		end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------

function UnseatVehicle()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("wk_actionmenu:confirmUnseat", GetPlayerServerId(t))
	else
		drawNotification("Unseated player from vehicle")
	end
end

RegisterNetEvent('wk_actionmenu:unseatme')
AddEventHandler('wk_actionmenu:unseatme', function(t)
	local ped = GetPlayerPed(t)        
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2
   
	SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Trunk

RegisterNetEvent( 'openTrunk' )
AddEventHandler( 'openTrunk', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
            SetVehicleDoorShut(veh, 5, false)
			drawNotification("~w~You closed your trunk.")
        else
            SetVehicleDoorOpen(veh, 5, false, false)
			drawNotification("~w~You opened your trunk.")
        end
    end
end, false)

-- Hood


RegisterNetEvent( 'openHood' )
AddEventHandler( 'openHood', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
            SetVehicleDoorShut(veh, 4, false)
			drawNotification("~w~You closed your hood.")
        else
            SetVehicleDoorOpen(veh, 4, false, false)
			drawNotification("~w~You opened your hood.")
        end
    end
end, false)

RegisterNetEvent( 'frontLeft' )
AddEventHandler( 'frontLeft', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 0) > 0 then
            SetVehicleDoorShut(veh, 0, false)
			drawNotification("~w~You closed the front left door.")
        else
            SetVehicleDoorOpen(veh, 0, false, false)
			drawNotification("~w~You opened the front left door.")
        end
    end
end, false)

RegisterNetEvent( 'frontRight' )
AddEventHandler( 'frontRight', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 1) > 0 then
            SetVehicleDoorShut(veh, 1, false)
			drawNotification("~w~You closed the front right door.")
        else
            SetVehicleDoorOpen(veh, 1, false, false)
			drawNotification("~w~You opened the front right door.")
        end
    end
end, false)

RegisterNetEvent( 'rearLeft' )
AddEventHandler( 'rearLeft', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 2) > 0 then
            SetVehicleDoorShut(veh, 2, false)
			drawNotification("~w~You closed the rear left door.")
        else
            SetVehicleDoorOpen(veh, 2, false, false)
			drawNotification("~w~You opened the rear left door.")
        end
    end
end, false)

RegisterNetEvent( 'rearRight' )
AddEventHandler( 'rearRight', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 3) > 0 then
            SetVehicleDoorShut(veh, 3, false)
			drawNotification("~w~You closed the rear right door.")
        else
            SetVehicleDoorOpen(veh, 3, false, false)
			drawNotification("~w~You opened the rear right door.")
        end
    end
end, false)

-- [Adverts]

-- ADVERTISMENTS
RegisterNetEvent("ad1")
AddEventHandler("ad1",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad1', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad1')
AddEventHandler('displayad1',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "247", true, 1, "~y~24/7~s~", "");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad2")
AddEventHandler("ad2",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad2', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad2')
AddEventHandler('displayad2',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_AMMUNATION", "CHAR_AMMUNATION", true, 1, "~y~Ammunation~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad3")
AddEventHandler("ad3",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad3', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad3')
AddEventHandler('displayad3',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NEWS", true, 1, "~y~Weazel News~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad4")
AddEventHandler("ad4",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad4', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad4')
AddEventHandler('displayad4',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_STRIPCLUB_PR", "CHAR_MP_STRIPCLUB_PR", true, 1, "~y~Vanilla Unicorn~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad5")
AddEventHandler("ad5",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad5', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad5')
AddEventHandler('displayad5',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_TAXI", "CHAR_TAXI", true, 1, "~y~Downtown Cab Co.~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad6")
AddEventHandler("ad6",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad6', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad6')
AddEventHandler('displayad6',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_TOURIST_BOARD", "CHAR_LS_TOURIST_BOARD", true, 1, "~y~Los Santos Traffic Info~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad7")
AddEventHandler("ad7",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad7', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad7')
AddEventHandler('displayad7',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "~y~Los Santos Customs~s~", "");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad8")
AddEventHandler("ad8",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad8', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad8')
AddEventHandler('displayad8',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "ACE", true, 1, "~y~Ace Liquor~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad9")
AddEventHandler("ad9",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad9', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad9')
AddEventHandler('displayad9',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LTD", true, 1, "~y~Limited Gasoline~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad10")
AddEventHandler("ad10",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad10', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad10')
AddEventHandler('displayad10',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "POSTAL", true, 1, "~y~GoPostal~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad11")
AddEventHandler("ad11",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad11', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad11')
AddEventHandler('displayad11',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Hayes Auto~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad12")
AddEventHandler("ad12",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad12', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad12')
AddEventHandler('displayad12',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "VAN", true, 1, "~y~Vangelico~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad13")
AddEventHandler("ad13",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad13', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad13')
AddEventHandler('displayad13',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BELL", true, 1, "~y~Cluckin' Bell~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad14")
AddEventHandler("ad14",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad14', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad14')
AddEventHandler('displayad14',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BUG", true, 1, "~y~Bugstars~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad15")
AddEventHandler("ad15",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad15', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad15')
AddEventHandler('displayad15',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_BANK_FLEECA", "CHAR_BANK_FLEECA", true, 1, "~y~Fleeca Bank~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad16")
AddEventHandler("ad16",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad16', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad16')
AddEventHandler('displayad16',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Echo Sechs~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad17")
AddEventHandler("ad17",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad17', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad17')
AddEventHandler('displayad17',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_MORS_MUTUAL", "CHAR_MP_MORS_MUTUAL", true, 1, "~y~Mors Mutual Insurance~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad18")
AddEventHandler("ad18",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad18', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad18')
AddEventHandler('displayad18',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "OP", true, 1, "~y~PostOP~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad19")
AddEventHandler("ad19",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad19', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad19')
AddEventHandler('displayad19',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "EXOTIC", true, 1, "~y~Auto Exotic~s~", "");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad20")
AddEventHandler("ad20",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad20', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad20')
AddEventHandler('displayad20',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LSWP", true, 1, "~y~Los Santos Water and Power~s~", "");
DrawNotification(false, true);

end)
--
--
RegisterNetEvent("ad21")
AddEventHandler("ad21",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad21', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end
		 
	
end)
end)

RegisterNetEvent('displayad21')
AddEventHandler('displayad21',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "D8", true, 1, "~y~Dynasty 8~s~", "");
DrawNotification(false, true);

end)

-- END OF ADVERTISMENTS

-- [Outfits]

-- LSPD Start

RegisterNetEvent("lspdOutfit")
AddEventHandler("lspdOutfit",function()
local model = GetHashKey("s_m_y_cop_10")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)

    chatPrint( "Your Area loadout has been equipped!")	
end)

-- LSPD End

-- BCSO Start

RegisterNetEvent("bcsoOutfit")
AddEventHandler("bcsoOutfit",function()
local model = GetHashKey("s_m_y_cop_11")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)

    chatPrint( "Your Traffic loadout has been equipped!")	
end)

-- BCSO End

-- SAHP Start

RegisterNetEvent("sahpOutfit")
AddEventHandler("sahpOutfit",function()
local model = GetHashKey("s_m_y_swat_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 1000, false)
	--GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false)
    chatPrint( "Your Force Support loadout has been equipped!")	
end)

RegisterNetEvent("lspdOutfit1")
AddEventHandler("lspdOutfit1",function()
local model = GetHashKey("s_m_y_brit_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 1000, false)
	--GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)
    chatPrint( "Your Plain Clothed loadout has been equipped!")	
end)

RegisterNetEvent("sahpOutfit12")
AddEventHandler("sahpOutfit12",function()
local model = GetHashKey("s_m_y_swat_50")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 1000, false)
	--GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false)
    chatPrint( "Your SFO Support loadout has been equipped!")	
end)

-- SAHP End

-- Firefighter Start

RegisterNetEvent("fireOutfit")
AddEventHandler("fireOutfit",function()
local model = GetHashKey("s_m_y_fireman_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLARE"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FIREEXTINGUISHER"), 1000, false)
    chatPrint("Your Fire Department loadout has been equipped!")	
end)

-- Firefighter End

-- Medic Start

RegisterNetEvent("medicOutfit")
AddEventHandler("medicOutfit",function()
local model = GetHashKey("s_m_m_paramedic_01")
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
    chatPrint("Your EMS loadout has been equipped!")	
end)

-- Medic End

-- Delete Vehicle Start -- 

RegisterNetEvent( 'wk:deleteVehicle' )
 
local distanceToCheck = 5.0

AddEventHandler( 'wk:deleteVehicle', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else 
                	ShowNotification( "~g~Success: ~w~Vehicle deleted." )
                end 
            else 
                ShowNotification( "You must be in the driver's seat!" )
            end 
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then 
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then 
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else 
                	ShowNotification( "~g~Success: ~w~Vehicle deleted." )
                end 
            else 
                ShowNotification( "You must be in or near a vehicle to delete it." )
            end 
        end 
    end 
end )

-- Delete car function borrowed frtom Mr.Scammer's model blacklist, thanks to him!
function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

-- Delete Vehicle End

-- Civ Emotes Start  --

RegisterNetEvent('Smoke')
AddEventHandler('Smoke', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Party')
AddEventHandler('Party', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PARTYING", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Drink')
AddEventHandler('Drink', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRINKING", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Pushups')
AddEventHandler('Pushups', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PUSH_UPS", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Phone')
AddEventHandler('Phone', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Injured')
AddEventHandler('Injured', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Weed')
AddEventHandler('Weed', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Coffee')
AddEventHandler('Coffee', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_AA_COFFEE", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Photo')
AddEventHandler('Photo', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PAPARAZZI", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Binoculars')
AddEventHandler('Binoculars', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BINOCULARS", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Situps')
AddEventHandler('Situps', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SIT_UPS", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Film')
AddEventHandler('Film', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Weights')
AddEventHandler('Weights', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

RegisterNetEvent('Flex')
AddEventHandler('Flex', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FLEX", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Civ Emotes End --
--[[
RegisterNetEvent('Engine')
 
local vehicles = {}
local State = {}
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))) then
            table.insert(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))
            table.insert(State, IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))))
        elseif IsPedInAnyVehicle(GetPlayerPed(-1), false) and not table.contains(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
            table.insert(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false))
            table.insert(State, IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false)))
        end
        for i = 1, tablelength(vehicles) do
            if (GetPedInVehicleSeat(vehicles[i], -1) == GetPlayerPed(-1)) or IsVehicleSeatFree(vehicles[i], -1) then
                SetVehicleEngineOn(vehicles[i], State[i], State[i], State[i])
            end
        end
    end
end)
 
AddEventHandler('Engine', function()
    local veh
    local StateIndex
    for i = 1, tablelength(vehicles) do
        if vehicles[i] == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
            veh = vehicles[i]
            StateIndex = i
        end
    end
    if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
        if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
            if IsVehicleEngineOn(veh) then
                State[StateIndex] = false
            else
                State[StateIndex] = true
            end
        end
    end
end)
 --]]

function EngineToggle()
    player = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(player, false)
    if IsVehicleEngineOn(vehicle) then
        SetVehicleEngineOn(vehicle, false, false, true)
        SetVehicleUndriveable(vehicle, true)
    else
        SetVehicleEngineOn(vehicle, true, false, true)
        SetVehicleUndriveable(vehicle, false)
    end
end

function drawNotification(text) --Just Don't Edit!
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
 
function tablelength(T) --Just Don't Edit!
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end
 
function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent('Breath')
TriggerEvent( 'Breath' )
AddEventHandler("Breath", function(results)

	local dots = ". . . ."
	local timer = 0
		
	for timer=0,5,1 do
		SetNotificationTextEntry("STRING")
		AddTextComponentString("~b~~h~Breathalyzing~h~~n~~c~"..dots)
		local notify = DrawNotification(false, false)
		Citizen.Wait(1000)
		RemoveNotification(notify)
		dots = dots.." . . . ."
	end
		    
	if (results < "0.08") then
		SetNotificationTextEntry("STRING")
		AddTextComponentString("~b~~h~BAC Results:~h~~n~~g~ "..results.."%")
		local notify = DrawNotification(false, false)
	elseif (results >= "0.08") then
		SetNotificationTextEntry("STRING")
		AddTextComponentString("~b~~h~BAC Results:~h~~n~~r~"..results.."%")
		local notify = DrawNotification(false, false)
	elseif (results == nil) then
		SetNotificationTextEntry("STRING")
		AddTextComponentString("~b~~h~BAC Results:~h~~n~~g~ 0.000%")
		local notify = DrawNotification(false, false)
	end

	
end)


	-- Allows for server to client calls --

RegisterNetEvent("Breath")
RegisterNetEvent("NoResults")
RegisterNetEvent("Bac")
RegisterNetEvent("breathNearby")

	-- Chat Message for setting BAC --
	

AddEventHandler("Bac", function()
	SetNotificationTextEntry("STRING")
	AddTextComponentString("~g~BAC Set!")
	DrawNotification(false, false)
end)

AddEventHandler("breathNearby", function()
local ped = GetPlayerPed(-1)
	local nearestPlayer = GetNearestPlayerToEntity(ped)
	local entityType = GetEntityType(ped)
	
	shortestDistance = 2
	closestId = 0
	
	for id = 0, 32 do
        if NetworkIsPlayerActive( id ) and GetPlayerPed(id) ~= GetPlayerPed(-1) then
			ped1 = GetPlayerPed( id )
			local x,y,z = table.unpack(GetEntityCoords(ped))
                if (GetDistanceBetweenCoords(GetEntityCoords(ped1), x,y,z) <  shortestDistance) then
					
					shortestDistance = GetDistanceBetweenCoords(GetEntityCoords(ped), x,y,z)
					closestId = GetPlayerServerId(id)	
							
			
				end
				
        end		
	end
	TriggerServerEvent("returnData", closestId)
end)




















