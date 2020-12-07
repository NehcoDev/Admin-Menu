	
	
	
	function fuck()print('==================================') print('^3ATTENTION FIVE DEV ARNAQUE') print('^4WIZZY PREND DES SCRIPT ET DIS cest luis il les créer') print('^5PARDON MON FRANCAIS') print('^2 mon discord https://discord.gg/FcD5ccW') Citizen.Wait(10000) fuck() end
	
	
	ESX = nil local PlayerData = {} local isPlayerSpawned = false local showcoord = false Config = {} local playerGroup = nil local ListPlayer = {} local ListItem = {} Citizen.CreateThread(function()  while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end while ESX.GetPlayerData().job == nil do Citizen.Wait(10) end ESX.PlayerData = ESX.GetPlayerData() fuck()--[[ while playerGroup == nil do ESX.TriggerServerCallback('neo_admin:getgroupadmin', function(group) playerGroup = group end) Citizen.Wait(10) end ]] end)
	local Neo = true 

print("^0[^4Author^0] ^7:^0 ^0Neo^7")
print("^0[^4Author^0] ^7:^0 ^0Neo^7")

function DrawTextAdmin(m_text, showtime)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end 


RegisterNetEvent("FUCKLESLEAKER:WIZZY_cest_pas_de")
AddEventHandler("FUCKLESLEAKER:WIZZY_cest_pas_de", function(reason)
    PlaySoundFrontend(-1, "CHARACTER_SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    ESX.ShowNotification("~r~Message Staff~s~ :\n"..reason)
end)
 



function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)
Admin = { 
    actuellementspec = false,
    godmod = false,
    noclip = false,
    supersaut = false,
    staminainfini = false,
    fastrun = false,
    showcoords = false,
    showcrosshair = false
    --nomtete = false
}
function retournercar()
    local pPed = GetPlayerPed(-1)
    posped = GetEntityCoords(pPed)
    carspawndep = GetClosestVehicle(posped['x'], posped['y'], posped['z'], 10.0,0,70)
	if carspawndep ~= nil then
		platecarspawndep = GetVehicleNumberPlateText(carspawndep)
	end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
	SetEntityCoords(carspawndep, playerCoords)
end

local godmodec = true
function playergodmod()
	godmodec = not godmodec
	local pPed = GetPlayerPed(-1)
	if not godmodec then
		SetEntityInvincible(pPed, true)
		ESX.DrawMissionText("~g~Invincible", 99999999999999999999) 
	elseif godmodec then
		SetEntityInvincible(pPed, false)
		ESX.DrawMissionText("", 0)
	end
end
local invisible = true
function playerinvisible()
	invisible = not invisible
	local pPed = GetPlayerPed(-1)
	if not invisible then
		SetEntityVisible(pPed, false, false)
		ESX.DrawMissionText("~g~Invisible", 99999999999999999999)  
	elseif invisible then
		SetEntityVisible(pPed, true, false)
		ESX.DrawMissionText("", 0)
	end
end
local noclip = false
local noclip_speed = 1.5
function playernoclip()
	noclip = not noclip
	local ped = GetPlayerPed(-1)
	if noclip then -- activé
		SetEntityVisible(ped, false, false)
		ESX.DrawMissionText("~g~Noclip", 99999999999999999999)
	else -- désactivé
		SetEntityVisible(ped, true, false)
		ESX.DrawMissionText("", 0) 
	end
end
function getPosition()
	local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
	return x,y,z
end
function getCamDirection()
	local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
	local pitch = GetGameplayCamRelativePitch()
	local x = -math.sin(heading*math.pi/180.0)
	local y = math.cos(heading*math.pi/180.0)
	local z = math.sin(pitch*math.pi/180.0)
	local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
		x = x/len
		y = y/len
		z = z/len
	end
	return x,y,z
end
function isNoclip()
	return noclip
end
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if noclip then
			local ped = GetPlayerPed(-1)
			local x,y,z = getPosition()
			local dx,dy,dz = getCamDirection()
			local speed = noclip_speed
			SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
		if IsControlPressed(0,32) then -- MOVE UP
			x = x+speed*dx
			y = y+speed*dy
			z = z+speed*dz
		end
		if IsControlPressed(0,269) then -- MOVE DOWN
			x = x-speed*dx
			y = y-speed*dy
			z = z-speed*dz
		end
		SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputvehicle == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputvehicle = 0
			elseif UpdateOnscreenKeyboard() == 1 then
					inputvehicle = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputvehicle = 0
			end
		end
		if inputvehicle == 2 then
		local vehicleidd = GetOnscreenKeyboardResult()
				local car = GetHashKey(vehicleidd)
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					RequestModel(car)
					SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
					while not HasModelLoaded(car) do
						Citizen.Wait(0)
					end 
                    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
					veh = CreateVehicle(car, x,y,z, 0.0, true, false)
					SetEntityVelocity(veh, 2000)
					SetVehicleOnGroundProperly(veh)
					SetVehicleHasBeenOwnedByPlayer(veh,true)
					local id = NetworkGetNetworkIdFromEntity(veh)
					SetNetworkIdCanMigrate(id, true)
					SetVehRadioStation(veh, "OFF")
					SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
					SetPedIntoVehicle(GetPlayerPed(-1),  veh,  -1)
					--Notify("Véhicule spawn, bonne route")
				end)
        inputvehicle = 0
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if inputplate == 1 then
			if UpdateOnscreenKeyboard() == 3 then
				inputplate = 0
			elseif UpdateOnscreenKeyboard() == 1 then
				inputplate = 2
			elseif UpdateOnscreenKeyboard() == 2 then
				inputplate = 0
			end
		end
		if inputplate == 2 then
		local vehicleplate = GetOnscreenKeyboardResult()
				Citizen.CreateThread(function()
					Citizen.Wait(10)
					SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false), vehicleplate)
				end)
			inputplate = 0
		end
	end
end)
function changeplayerskin()
	CloseMenu(force)
	Citizen.Wait(100)
	TriggerEvent('esx_skin:openSaveableMenu', source)
end
print("Péèlo#2482")
function tpplayermarker()
	local WaypointHandle = GetFirstBlipInfoId(8)
	if DoesBlipExist(WaypointHandle) then
		local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
		for height = 1, 1000 do
			SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
			local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
			if foundGround then
				SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
				break
			end
			Citizen.Wait(50)  
		end
	end
end
function admin_heal_player()
	local plyId = KeyboardInput1("NEO_BOX_ID", "", "", 8)
	if plyId ~= nil then
		plyId = tonumber(plyId)
		if type(plyId) == 'number' then
			TriggerServerEvent('esx_ambulancejob:revive', plyId)
		end
	end
end
function showplayername()
	showname = not showname
end
local activerposition = true
function activpos()
	activerposition = not activerposition
	local pPed = GetPlayerPed(-1)
	if not activerposition then
		showcoord = true
	elseif activerposition then
		showcoord = false
	end
end
local afficherlesnoms = true
function activename()
	afficherlesnoms = not afficherlesnoms
	local pPed = GetPlayerPed(-1)
	if not afficherlesnoms then
		showname = true
	elseif afficherlesnoms then
		showname = false
	end
end
MainColor = {
	r = 225, 
	g = 55, 
	b = 55,
	a = 255
}
function TouslesJoueursCO()
    local joueurs = 0
    for _, i in ipairs(GetActivePlayers()) do
        joueurs = joueurs + 1
    end
    return joueurs
end

function KeyboardInput(entryTitle, textEntry, inputText, maxLength)
    AddTextEntry(entryTitle, textEntry)
    DisplayOnscreenKeyboard(1, entryTitle, '', inputText, '', '', '', maxLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end
 

function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleColours(vehicle, 0, 0)
		SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 12) 
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
		for i = 0,14 do
			SetVehicleExtra(veh, i, 0)
		end
		SetVehicleModKit(veh, 0)
		for i = 0,49 do
			local custom = GetNumVehicleMods(veh, i)
			for j = 1,custom do
				SetVehicleMod(veh, i, math.random(1,j), 1)
			end
		end
	end
end
 
local Spectating = false


function SpectatePlayer(player)
	--local playerPed = PlayerPedId()
	Spectating = not Spectating
	local targetPed = GetPlayerPed(player)
	if(Spectating)then
		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(true, targetPed)
		ESX.DrawMissionText('Spectating '..GetPlayerName(player))  
	else
		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(false, targetPed)
		ESX.DrawMissionText('Stopped Spectating '..GetPlayerName(player))
	end
end  

    
function getPlayers()
	local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		-- do stuff
	end
	return players
end
Citizen.CreateThread(function()
    while true do
        Wait(1)
        getPlayers()
    end
end)
local players = getPlayers()
for _, v in pairs(players) do 
    refresh = true,
    table.insert(ListPlayer, {name = GetPlayerName(v), ask = GetPlayerServerId(v), askX = true})
end

    
function loadModel(modelHash) local model = GetHashKey(modelHash) RequestModel(model) while not HasModelLoaded(model) do RequestModel(model) Citizen.Wait(0) end SetPlayerModel(localPed, model) SetModelAsNoLongerNeeded(model) end 
 

function functionCheckBox() 
    Neo = not Neo
	if not Neo then  
		local model = GetEntityModel(GetPlayerPed(-1))

		ESX.TriggerServerCallback("neo_admin:getgroupadmin",function(plyGroup)
		DrawTextAdmin("Mode d'administration activé\nRang ~s~:~g~ "..plyGroup.."", 5525515552551555255155525515)    
		-- loadModel("csb_ballasog")    
	
		
		if model == GetHashKey("mp_m_freemode_01") then
			tenuesuperadmin()   else 	tenuesuperadmin2() end     
		
	  OpenMenu('Options')   
		end)
	elseif Neo then       
		DrawTextAdmin("", 200)     
		TriggerEvent('skinchanger:getSkin', function(skin) 
			loadModel("mp_m_freemode_01")   
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)  
		ESX.ShowAdvancedNotification('~b~Moonlife Rp~s~', '~r~Admin', 'Tu vien de mettre ta tenue Civil !', 'CHAR_STEVE_TREV_CONF')
	end)    
		end   
	end  



local function OnSelected(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
	local slide = btn.slidenum
	local btn = btn.name
	local check = btn.unkCheckbox
	local id = GetPlayerName(i)  
	local namejoueur = GetPlayerName(i)
	 
	if btn == "Téléportation/Messages" then
		if not Neo then 
			OpenMenu("Téléportation/Messages")
		end  
	elseif btn == "Joueur" then 
		if not Neo then 
			OpenMenu('Joueur') 
		end 
	elseif btn == "Mon personnage" then 
		if not Neo then 
			OpenMenu('Mon personnage') 
		end  
	elseif btn == "Véhicules" then
		if not Neo then 
			OpenMenu("Véhicules")
		end 
	elseif btn == "Argent" then
		if not Neo then 
			OpenMenu("Argent") 
		end 
	elseif btn == "Divers" then
		if not Neo then 
			OpenMenu("Divers") 
		end 

	elseif btn == "Menu mecano" then 
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
             OpenMenu('Menu mecano')       
		else
			ESX.ShowNotification("Vous êtes pas dans un ~g~vehicule")  
		end

	elseif btn == "Réanimer un joueur" then
		admin_heal_player()
	elseif btn == "TP sur un joueur" then
		local plyId = KeyboardInput("Envoyer un message : ",  "Montant :","" ,10)
		if plyId ~= nil then
			plyId = tonumber(plyId)   
		TriggerServerEvent('KorioZ-PersonalMenu:Admin_BringS', GetPlayerServerId(PlayerId()), plyId)
		end
	elseif btn == "TP joueur sur moi" then 
		local plyId = KeyboardInput("Envoyer un message : ",  "Montant :","" ,10)  
		if plyId ~= nil then
			plyId = tonumber(plyId)   
		TriggerServerEvent('KorioZ-PersonalMenu:Admin_BringS', plyId, GetPlayerServerId(PlayerId())) 
		end 
	elseif btn == "TP sur le marqueur" then
		tpplayermarker()
	elseif btn == "NoClip" then 
		playernoclip()
	elseif btn == "Invincible" then 
		playergodmod()
	elseif btn == "Fantôme" then 
		playerinvisible()
	elseif btn == "Changer d'apparence" then 
		changeplayerskin()
	elseif btn == "Spawn un véhicule" then 
		DisplayOnscreenKeyboard(true, "", "", "", "", "", "", 10)
		inputvehicle = 1 
		CloseMenu(forcer) 
	elseif btn == "Réparer un véhicule" then
		SetVehicleFixed(GetVehiclePedIsUsing(PlayerPedId()))
	elseif btn == "S'octroyer du cash" then
		local amount = KeyboardInput("Envoyer un message : ",  "Montant :","" ,132)
		if amount ~= nil then
			amount = tonumber(amount)  
		TriggerServerEvent('CACAAAAAAAAAAAAAAAAAAAAAAAAAAA', amount)
		end  
	elseif btn == "S'octroyer de l'argent (banque)" then
		local amount = KeyboardInput("Envoyer un message : ",  "Montant :","" ,132)
		if amount ~= nil then
			amount = tonumber(amount)  
		TriggerServerEvent('FUCKLESLEAKERSSSSSSS', amount)
		end  
	elseif btn == "S'octroyer de l'argent (sale)" then
		local amount = KeyboardInput("Envoyer un message : ",  "Montant :","" ,132)
		if amount ~= nil then
			amount = tonumber(amount)  
		TriggerServerEvent('FIVE_DEV_(cestpasdesdev)', amount) 
		end  
	elseif btn == "Retourner un véhicule" then 
		retournercar()
	elseif btn == "Afficher/Cacher coordonnées" then
		activpos()
	elseif btn == "Afficher/Cacher nom des joueurs" then 
		activename()
	elseif btn == "Modifier la plaque du véhicule" then 
		DisplayOnscreenKeyboard(true, "NEO_S", "", "", "", "", "", 8)
		inputplate = 1   
	elseif btn == "Customiser le véhicule" then 
		FullVehicleBoost()

	elseif btn == GetPlayerName(PlayerId()) then 
		CloseMenu('OwnerMenu')
		CreateMenu(JoueurMenu)
	elseif btn == "Activer un crosshair" then 
		Admin.showcrosshair = not Admin.showcrosshair
	elseif btn == "Se give les clés du véhicule" then 
		local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local plate = GetVehicleNumberPlateText(veh)
		TriggerServerEvent('esx_vehiclelock:givekey', 'no', plate) 
--messages
	elseif btn == "Annonce (Public)" then 
		local messageStaff = KeyboardInput("Envoyer un message : ",  "Annonce Staff","" ,132)
		if messageStaff ~= nil then
			messageStaff = tostring(messageStaff)  
		TriggerServerEvent("annoncepersos",messageStaff)   	  
		end   
--jouer
  
--  
	elseif btn == "Clear l'inventaire" then 
		local id = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
		if id ~= nil then
			id = tonumber(id)  
			ExecuteCommand('clearinventory '..id..'')    
		end 
--  
	elseif btn == "Clear les armes" then 
		local id = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
		if id ~= nil then
			id = tonumber(id)  
			ExecuteCommand('clearloadout '..id..'')    
		end  
--
	elseif btn == "Kick" then 
		local id = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
		local raison = KeyboardInput("Envoyer un message : ",  "Raison :","" ,255)
		ExecuteCommand('kick '..id..' '..raison..'')     
		--ESX.ShowNotification("Vous avez kick l'id ~g~"..id)     
  
--  
	elseif btn == "Ban" then 
		local id = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
		local Heure = KeyboardInput("Envoyer un message : ",  "Temps :","" ,10)
		local raison = KeyboardInput("Envoyer un message : ",  "Raison :","" ,132) 

			ExecuteCommand('sqlban '..id..' '..Heure..' '..raison..'')  
		
		ESX.ShowNotification("Vous avez ban l'id ~g~"..id)    
  
--
	elseif btn == "Soigné" then 
		local id = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
		if id ~= nil then 
			id = tonumber(id)        

			ExecuteCommand('heal '..id..'')       
		ESX.ShowNotification("Vous avez heal l'id ~g~"..id)  
		end
	elseif btn == "Réanimer" then 
		local id = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)

		ExecuteCommand('revive '..id..'')   
		ESX.ShowNotification("Vous avez réanimer l'id ~g~"..id)  
	
--- oui  
	elseif btn == "Kick (ALL)" then  
		OpenMenu("Vous êtes Sur ?")
-- 
	elseif btn == "Oui Kick(ALL)" then 
		TriggerServerEvent('kickAllPlayerpéèlo')
--

		 
--non 
	elseif btn == "Non" then   
		OpenMenu("Options")
--
	elseif btn == "Clear le chat" then 
		ExecuteCommand('chatclear')
	--	ESX.ShowNotification("Vous avez clear le chat l'id ~g~"..id) 
--
	elseif btn == "Activé mode staff" then
			functionCheckBox() 
--          
	elseif btn == "Messages (Privé)" then 
		local IdSelected = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
		local raison = KeyboardInput("Envoyer un message : ",  "Message :","" ,255)
		if raison ~= nil then 
			raison = tostring(raison) 
			TriggerServerEvent("FUCKLESLEAKER", IdSelected, raison)
			--
			ESX.ShowNotification("Vous venez d'evoyer le message à l'id  ~b~" ..IdSelected.."  "..raison) 
		end     
	elseif btn == "Supprimer un véhicules" then 
		TriggerEvent('esx:deleteVehicle') 
		-- 


elseif btn == "Spectate" then
	local player = KeyboardInput("Envoyer un message : ",  "ID :","" ,10)
	SpectatePlayer(player) 
 
elseif slide == 1 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("15")
elseif slide == 2 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("14")
elseif slide == 3 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("13")
elseif slide == 4 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("12")
elseif slide == 5 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("11")
elseif slide == 6 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("10")
elseif slide == 7 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("9")
elseif slide == 8 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("8")
elseif slide == 9 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("7")
elseif slide == 10 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("6")
elseif slide == 11 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("5")
elseif slide == 12 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("4")
elseif slide == 13 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("3")
elseif slide == 14 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("2")
elseif slide == 15 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("1")
elseif slide == 16 and btn == "Annonce Reboot dans" then
	TriggerServerEvent("0") 

 
elseif slide == 1 and btn == "Couleur de vehicule" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		local y = KeyboardInput("Envoyer un message : ",  "R","" ,10)
		local x = KeyboardInput("Envoyer un message : ",  "G","" ,10)
		local c = KeyboardInput("Envoyer un message : ",  "B","" ,10)
		if c ~= nil then 
			c = tostring(c) 
		SetVehicleCustomPrimaryColour(vehicle, y, x, c) 
		SetVehicleCustomSecondaryColour(vehicle, y, x, c)   
		end 
		end
	elseif slide == 2 and btn == "Couleur de vehicule" then 
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleCustomPrimaryColour(vehicle, 51, 51, 255) 
		SetVehicleCustomSecondaryColour(vehicle, 51, 51, 255)  
		end
	elseif slide == 3 and btn == "Couleur de vehicule" then 
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleCustomPrimaryColour(vehicle, 255, 255, 51) 
		SetVehicleCustomSecondaryColour(vehicle, 255, 255, 51) 
		end
	elseif slide == 4 and btn == "Couleur de vehicule" then 
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleCustomPrimaryColour(vehicle, 51, 255, 51) 
		SetVehicleCustomSecondaryColour(vehicle, 51, 255, 51) 
		end
	elseif slide == 5 and btn == "Couleur de vehicule" then 
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleCustomPrimaryColour(vehicle, 153, 51, 255)
		SetVehicleCustomSecondaryColour(vehicle, 153, 51, 255)
		end  

elseif slide == 6 and btn == "Couleur de vehicule" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
	SetVehicleCustomPrimaryColour(vehicle, 255, 51, 51)
	SetVehicleCustomSecondaryColour(vehicle, 255, 51, 51)
	end  
		 


elseif slide == 0 and btn == "Tinture" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleWindowTint(vehicle, 0, true)
	end    
elseif slide == 1 and btn == "Tinture" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleWindowTint(vehicle, 1, true) 
	end  
elseif slide == 2 and btn == "Tinture" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleWindowTint(vehicle, 2, true)
	end  
elseif slide == 3 and btn == "Tinture" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleWindowTint(vehicle, 3, true)
	end  
elseif slide == 4 and btn == "Tinture" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleWindowTint(vehicle, 4, true)
	end  

elseif slide == 1 and btn == "Turbo" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

		ToggleVehicleMod(vehicle, 18, true)	
	end
elseif slide == 2 and btn == "Turbo" then 
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)

		ToggleVehicleMod(vehicle, 18, false)	
	end

elseif btn == "Wipe une personne" then 
	CloseMenu('Divers')
	ExecuteCommand('wipe')    



end
end


local ppa = {
	"Donner", 
	"Retirer"  
}

local minutes = { 
	"~b~15~s~ minutes",
	"~b~14~s~ minutes",
	"~b~13~s~ minutes",
	"~b~12~s~ minutes",
	"~b~11~s~ minutes",
	"~b~10~s~ minutes",
	"~o~9~s~ minutes",
	"~o~8~s~ minutes",
	"~o~7~s~ minutes",
	"~o~6~s~ minutes",
	"~o~5~s~ minutes",
	"~r~4~s~ minutes",
	"~r~3~s~ minutes",
	"~r~2~s~ minutes",
	"~r~1~s~ minutes", 
	"~r~Reboot~s~ minutes", 
}

local cl = {
	"Manuelle",
	"Bleu",
	"Jaune", 
	"Vert",
	"Violet",
	"Rouge",
}

local truefalse = {
	"Instaler",
	"Retirer"
}


local menuadmin = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 122}, Title = "Superadmin"},
	Data = { currentMenu = "Options"},
	Events = { onSelected = OnSelected },
	Menu = {
	
		["Options"] = {   
			b = {
				{name = "Activé mode staff", checkbox = false, Description = 'Attention activer ce mode pour utiliser le menu'},     
				{name = "Téléportation/Messages",ask = "→→→", askX = true},
				{name = "Joueur",ask = "→→→", askX = true}, 
				{name = "Mon personnage",ask = "→→→", askX = true},
				{name = "Véhicules",ask = "→→→", askX = true},
				{name = "Argent",ask = "→→→", askX = true},
				--{name = "Listes des joueurs",ask = "→→→", askX = true},
				{name = "Divers",ask = "→→→", askX = true}
			}
		},
		["Joueur"] = { 
			b = {
				{name = "Soigné",ask = "→", askX = true},
				{name = "Réanimer",ask = "→", askX = true}, 
				{name = "Spectate",ask = "→", askX = true}, 
				--{name = "Tuer",ask = "→", askX = true}, 
				{name = "Clear l'inventaire",ask = "→", askX = true},
				{name = "Clear les armes",ask = "→", askX = true},
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "Kick",ask = "→", askX = true},
				{name = "Ban",ask = "→", askX = true},
				{name = "Kick (ALL)",ask = "→→→", askX = true},

				
			}
		},
		["Vous êtes Sur ?"] = { 
			b = {
				{name = "Oui Kick(ALL)",ask = "→", askX = true},  
				{name = "Non",ask = "→", askX = true},
			}
		},  
		["Divers"] = {
			b = {  
				{name = "Clear le chat",ask = "→", askX = true},
				{name = "Wipe une personne",ask = "→", askX = true},
				{name = "Afficher/Cacher nom des joueurs", checkbox = false},
				{name = "Afficher/Cacher coordonnées", checkbox = false}
			}
		},
		["Argent"] = {
			b = { 
				{name = "S'octroyer du cash",ask = "→", askX = true},
				{name = "S'octroyer de l'argent (banque)",ask = "→", askX = true},
				{name = "S'octroyer de l'argent (sale)",ask = "→", askX = true},
				--{name = "---------------------------------------------------------------------", askX = true},
				--{name = "Ppa", slidemax = ppa},
				--{name = "Permis voiture", slidemax = ppa},
				--{name = "Permis moto", slidemax = ppa},
				--{name = "Permis poids lourds", slidemax = ppa},
				--{name = "Ajouter argent société",ask = "→", askX = true},
				--{name = "Retirer argent société",ask = "→", askX = true},
				--{name = "Liste des employée",ask = "→", askX = true},    
		 


			}
		},
		["Véhicules"] = {
			b = { 
				{name = "Réparer un véhicule",ask = "→", askX = true},
				{name = "Retourner un véhicule",ask = "→", askX = true},
				{name = "Spawn un véhicule",ask = "→", askX = true},
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "Menu mecano",ask = "→→→", askX = true},
				{name = "Supprimer un véhicules",ask = "→", askX = true},   
			}
		}, 

		["Menu mecano"] = {  
			b = { 
				{name = "Modifier la plaque du véhicule",ask = "→", askX = true},
				{name = "Customiser le véhicule",ask = "→", askX = true}, 
				{name = "Tinture",slidemax = 4}, 
				{name = "Turbo",slidemax = truefalse}, 
				{name = "Couleur de vehicule",slidemax = cl},  
			   
			}
		}, 
		["Mon personnage"] = {
			b = { 
				{name = "NoClip", checkbox = false, },
				{name = "Invincible", checkbox = false, },
				{name = "Fantôme", checkbox = false, },
				--{name = "Super Sprint", checkbox = false, }, 
				--{name = "Super Jump", checkbox = false,},
				--{name = "Activer un crosshair", checkbox = false, },
				{name = "Changer d'apparence", ask = "→", askX = true, },
				--{name = "Se give une arme"},
			}
		},
		["Téléportation/Messages"] = {
			b = { 
				{name = "Messages (Privé)",ask = "→", askX = true},  
				{name = "Annonce (Public)",ask = "→", askX = true},   
				{name = "Annonce Reboot dans",slidemax = minutes},  
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "TP sur le marqueur",ask = "→", askX = true},
				{name = "TP sur un joueur",ask = "→", askX = true},
				{name = "TP joueur sur moi",ask = "→", askX = true},
				--{name = "Réanimer un joueur"}
			}
		} 
	
	}
}

local menuadmin2= { 
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {122, 122, 122}, Title = "Admin"},
	Data = { currentMenu = "Options"},
	Events = { onSelected = OnSelected },
	Menu = { 
		["Options"] = {  
			b = {
				{name = "Activé mode staff", checkbox = false, Description = 'Attention activer ce mode pour utiliser le menu'},    
		
				{name = "Téléportation/Messages",ask = "→→→", askX = true},
				{name = "Joueur",ask = "→→→", askX = true}, 
				{name = "Mon personnage",ask = "→→→", askX = true},
				{name = "Véhicules",ask = "→→→", askX = true},
				--{name = "Argent",ask = "→→→", askX = true},
				--{name = "Listes des joueurs",ask = "→→→", askX = true},
				{name = "Divers",ask = "→→→", askX = true}
			}
		},
		["Joueur"] = { 
			b = {
				{name = "Soigné",ask = "→", askX = true},
				{name = "Réanimer",ask = "→", askX = true},  
				{name = "Spectate",ask = "→", askX = true}, 
				--{name = "Tuer",ask = "→", askX = true}, 
				{name = "Clear l'inventaire",ask = "→", askX = true},
				{name = "Clear les armes",ask = "→", askX = true},
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "Kick",ask = "→", askX = true},
				{name = "Ban",ask = "→", askX = true},
				--{name = "Kick (ALL)",ask = "→→→", askX = true},

				
			}
		},
		["Vous êtes Sur ?"] = {
			b = {
				--{name = "Oui Kick(ALL)",ask = "→", askX = true},  
				--{name = "Non",ask = "→", askX = true},
			}
		},  
		["Divers"] = {
			b = {  
				{name = "Clear le chat",ask = "→", askX = true},
				{name = "Afficher/Cacher nom des joueurs", checkbox = false},
				{name = "Afficher/Cacher coordonnées", checkbox = false}
			}
		},
		["Argent"] = {
			b = { 
				--{name = "S'octroyer du cash",ask = "→", askX = true},
				--{name = "S'octroyer de l'argent (banque)",ask = "→", askX = true},
				--{name = "S'octroyer de l'argent (sale)",ask = "→", askX = true},
				--{name = "---------------------------------------------------------------------", askX = true},
				--{name = "Ajouter argent société",ask = "→", askX = true},
				--{name = "Retirer argent société",ask = "→", askX = true},
				--{name = "Liste des employée",ask = "→", askX = true},    
		


			}
		},
		["Véhicules"] = {
			b = { 
				{name = "Réparer un véhicule",ask = "→", askX = true},
				{name = "Retourner un véhicule",ask = "→", askX = true},
				{name = "Spawn un véhicule",ask = "→", askX = true},
				{name = "Changer couleur véhicule",ask = "→", askX = true},
				--{name = "Modifier la plaque du véhicule",ask = "→", askX = true},
				--{name = "Customiser le véhicule",ask = "→", askX = true},
				{name = "Supprimer un véhicules",ask = "→", askX = true},
				--{name = "Arrêter de Supprimer des véhicules en boucle"},
			}
		},
		["changer couleur véhicule"] = { 
			b = { 
				{name = "Manuelle",ask = "→", askX = true},
				{name = "Bleu",ask = "→", askX = true},
				{name = "Jaune",ask = "→", askX = true},
				{name = "Vert",ask = "→", askX = true}, 
				{name = "Violet",ask = "→", askX = true},  
			    
			}
		}, 
		["Mon personnage"] = {
			b = { 
				{name = "NoClip", checkbox = false, },
				{name = "Invincible", checkbox = false, },
				{name = "Fantôme", checkbox = false, },
				--{name = "Super Sprint", checkbox = false, }, 
				--{name = "Super Jump", checkbox = false,},
				--{name = "Activer un crosshair", checkbox = false, },
				--{name = "Changer d'apparence", ask = "→", askX = true, },
				--{name = "Se give une arme"},
			}
		},
		["Téléportation/Messages"] = {  
			b = { 
				{name = "Messages (Privé)",ask = "→", askX = true},  
				{name = "Annonce (Public)",ask = "→", askX = true}, 
				{name = "Annonce Reboot dans",slidemax = minutes},   
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "TP sur le marqueur",ask = "→", askX = true},
				{name = "TP sur un joueur",ask = "→", askX = true}, 
				{name = "TP joueur sur moi",ask = "→", askX = true},
				--{name = "Réanimer un joueur"}
			}
		} 
	
	}
}
 
local menuadmin3 = { 
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Modo"},
	Data = { currentMenu = "Options"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Options"] = {   
			b = {
				{name = "Activé mode staff", checkbox = false, Description = 'Attention activer ce mode pour utiliser le menu'},    
		
				{name = "Téléportation/Messages",ask = "→→→", askX = true},
				{name = "Joueur",ask = "→→→", askX = true}, 
				{name = "Mon personnage",ask = "→→→", askX = true},
				{name = "Véhicules",ask = "→→→", askX = true},
				--{name = "Argent",ask = "→→→", askX = true},
				--{name = "Listes des joueurs",ask = "→→→", askX = true},
				{name = "Divers",ask = "→→→", askX = true}
			}
		}, 
		["Joueur"] = { 
			b = {
				{name = "Soigné",ask = "→", askX = true},
				{name = "Réanimer",ask = "→", askX = true},  
				{name = "Spectate",ask = "→", askX = true}, 
				--{name = "Tuer",ask = "→", askX = true},  
				{name = "Clear l'inventaire",ask = "→", askX = true},
				{name = "Clear les armes",ask = "→", askX = true},
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "Kick",ask = "→", askX = true},
				{name = "Ban",ask = "→", askX = true},
				--{name = "Kick (ALL)",ask = "→→→", askX = true},

				
			}
		},
		["Vous êtes Sur ?"] = {
			b = {
				--{name = "Oui Kick(ALL)",ask = "→", askX = true},  
				--{name = "Non",ask = "→", askX = true},
			}
		},  
		["Divers"] = {
			b = {  
				{name = "Clear le chat",ask = "→", askX = true},
				{name = "Afficher/Cacher nom des joueurs", checkbox = false},
				{name = "Afficher/Cacher coordonnées", checkbox = false}
			} 
		},
		["Argent"] = {
			b = { 
				--{name = "S'octroyer du cash",ask = "→", askX = true},
				--{name = "S'octroyer de l'argent (banque)",ask = "→", askX = true},
				--{name = "S'octroyer de l'argent (sale)",ask = "→", askX = true},
				--{name = "---------------------------------------------------------------------", askX = true},
				--{name = "Ajouter argent société",ask = "→", askX = true},
				--{name = "Retirer argent société",ask = "→", askX = true},
				--{name = "Liste des employée",ask = "→", askX = true},    
		


			}
		},
		["Véhicules"] = {
			b = { 
				{name = "Réparer un véhicule",ask = "→", askX = true},
				{name = "Retourner un véhicule",ask = "→", askX = true},
				{name = "Spawn un véhicule",ask = "→", askX = true},
				{name = "Changer couleur véhicule",ask = "→", askX = true},
				--{name = "Modifier la plaque du véhicule",ask = "→", askX = true},
				--{name = "Customiser le véhicule",ask = "→", askX = true},
				{name = "Supprimer un véhicules",ask = "→", askX = true},
				--{name = "Arrêter de Supprimer des véhicules en boucle"},
			}
		},
		["changer couleur véhicule"] = { 
			b = { 
				{name = "Manuelle",ask = "→", askX = true},
				{name = "Bleu",ask = "→", askX = true},
				{name = "Jaune",ask = "→", askX = true},
				{name = "Vert",ask = "→", askX = true}, 
				{name = "Violet",ask = "→", askX = true},  
			   
			}
		}, 
		
		["Mon personnage"] = {
			b = { 
				{name = "NoClip", checkbox = false, },
				{name = "Invincible", checkbox = false, },
				{name = "Fantôme", checkbox = false, },
				--{name = "Super Sprint", checkbox = false, }, 
				--{name = "Super Jump", checkbox = false,},
				--{name = "Activer un crosshair", checkbox = false, },
				--{name = "Changer d'apparence", ask = "→", askX = true, },
				--{name = "Se give une arme"},
			}
		},
		["Téléportation/Messages"] = {
			b = {  
				{name = "Messages (Privé)",ask = "→", askX = true},  
				{name = "Annonce (Public)",ask = "→", askX = true},     
				{name = "Annonce Reboot dans",slidemax = minutes},  
				{name = "---------------------------------------------------------------------", askX = true},
				{name = "TP sur le marqueur",ask = "→", askX = true},
				{name = "TP sur un joueur",ask = "→", askX = true}, 
				{name = "TP joueur sur moi",ask = "→", askX = true}, 
				--{name = "Réanimer un joueur"}
			}
		} 
	
	}
}



function Text(text)
    SetTextColour(186, 186, 186, 255)
    SetTextFont(0)
    SetTextScale(0.378, 0.378)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.017, 0.977)
end


Citizen.CreateThread(
    function()
        while true do
            plyPed = PlayerPedId()
            if showcoord then
                local playerPos = GetEntityCoords(plyPed)
                local playerHeading = GetEntityHeading(plyPed)
                ESX.DrawMissionText(
                    "~b~X~s~ : " ..
                        playerPos.x ..
                            " ~b~Y~s~ : " ..
                                playerPos.y .. " ~b~Z~s~ : " .. playerPos.z .. " ~b~Angle~s~: " .. playerHeading
                )
            end
            if showname then
                for id = 0, 256 do
                    if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= plyPed then
                        local headId =
                            Citizen.InvokeNative(
                            0xBFEFE3321A3F5015,
                            GetPlayerPed(id),
                            (GetPlayerServerId(id) .. " - " .. GetPlayerName(id)),
                            false, 
                            false,
                            "",
                            false
                        )
                    end 
                end
            end
            Citizen.Wait(0)
        end
	end
)


 
function tenuesuperadmin() 
	TriggerEvent('skinchanger:getSkin', function()
		local couleur = math.random(0,9)
		if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
			TriggerEvent('skinchanger:loadSkin', {
				['sex'] = 0, 
				['bags_1'] = 0, ['bags_2'] = 0,  
				['tshirt_1'] = 15, ['tshirt_2'] = 2, 
				['torso_1'] = 178, ['torso_2'] = couleur,
				['arms'] = 31,
				['pants_1'] = 77, ['pants_2'] = couleur,
				['shoes_1'] = 55, ['shoes_2'] = couleur,
				['mask_1'] = 0, ['mask_2'] = 0,
				['bproof_1'] = 0,
				['chain_1'] = 0,
				['helmet_1'] = -1, ['helmet_2'] = couleur,
			})
	
		end
	end) 
end 

   
function tenuesuperadmin2() 
	TriggerEvent('skinchanger:getSkin', function()
		local couleur = math.random(0,9)
		if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then
			TriggerEvent('skinchanger:loadSkin', {
				['sex'] = 1, 
				['bags_1'] = 0, ['bags_2'] = 0,
				['tshirt_1'] = 31, ['tshirt_2'] = 0,
				['torso_1'] = 180, ['torso_2'] = couleur,
				['arms'] = 36, ['arms_2'] = 0,
				['pants_1'] = 79, ['pants_2'] = couleur,
				['shoes_1'] = 58, ['shoes_2'] = couleur,
				['mask_1'] = 0, ['mask_2'] = 0,
				['bproof_1'] = 0,
				['chain_1'] = 0,
				['helmet_1'] = -1, ['helmet_2'] = couleur, 
			})  
	 
		end
	end) 
end 


Citizen.CreateThread(
    function(source)
        while true do
            Wait(1)
            if IsControlJustReleased(0, 244) then
				TriggerEvent("Staff:OpenMenu", source)  
				TriggerServerEvent("personalmenu:quiaouvertlemenu") 
            end
        end
    end
)
 
RegisterNetEvent("Staff:OpenMenu")    
AddEventHandler("Staff:OpenMenu",function() 
        ESX.TriggerServerCallback("neo_admin:getgroupadmin",function(plyGroup)
                if plyGroup ~= nil and (plyGroup == "superadmin") then
					CreateMenu(menuadmin)
                else
                    if plyGroup ~= nil and (plyGroup == "admin") then
                        CreateMenu(menuadmin2)
                    else
                        if plyGroup ~= nil and (plyGroup == "mod") then
                            CreateMenu(menuadmin3)
                        end
                    end
                end
            end
        )
    end, 
    false
)


print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^0 ^0Neo^7")
print("^0======================================================================^7")
	
