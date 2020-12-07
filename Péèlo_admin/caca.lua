ESX = nil


TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)
 

-- RegisterServerEvent("personalmenu:messagestaff")
-- AddEventHandler("personalmenu:messagestaff", function(valuejoueur, messageStaff)
--     local xTarget = ESX.GetPlayerFromId(valuejoueur)
-- 	TriggerClientEvent("ESX.ShowNotification", xTarget.source, "~r~Message staff :\n~s~"..messageStaff)
-- end)  

RegisterServerEvent('KorioZ-PersonalMenu:Admin_BringS')
AddEventHandler('KorioZ-PersonalMenu:Admin_BringS', function(plyId, targetId)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()
	if isAuthorized(getAdminCommand('bring'), plyGroup) or isAuthorized(getAdminCommand('goto'), plyGroup) then
		local targetCoords = GetEntityCoords(GetPlayerPed(targetId))
		TriggerClientEvent('KorioZ-PersonalMenu:Admin_BringC', plyId, targetCoords)
	end 
end)   

RegisterServerEvent('CACAAAAAAAAAAAAAAAAAAAAAAAAAAA')
AddEventHandler('CACAAAAAAAAAAAAAAAAAAAAAAAAAAA', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()
	if isAuthorized(getAdminCommand('givemoney'), plyGroup) then
		xPlayer.addAccountMoney('cash', money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'GIVE de ' .. money .. '$')
	end
end)
RegisterServerEvent('FUCKLESLEAKERSSSSSSS')
AddEventHandler('FUCKLESLEAKERSSSSSSS', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()
	if isAuthorized(getAdminCommand('givebank'), plyGroup) then
		xPlayer.addAccountMoney('bank', money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'GIVE de ' .. money .. '$ en banque')
	end
end)

RegisterServerEvent('FIVE_DEV_(cestpasdesdev)')
AddEventHandler('FIVE_DEV_(cestpasdesdev)', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	local plyGroup = xPlayer.getGroup()
	if isAuthorized(getAdminCommand('givedirtymoney'), plyGroup) then
		xPlayer.addAccountMoney('dirtycash', money)
		TriggerClientEvent('esx:showNotification', xPlayer.source, 'GIVE de ' .. money .. '$ sale')
	end
end) 


RegisterServerEvent("neo_admin:bringplayer")
AddEventHandler("neo_admin:bringplayer",
    function(plyId, plyPedCoords)
        TriggerClientEvent("neo_admin:bringplayer", plyId, plyPedCoords)
    end
)
ESX.RegisterServerCallback("neo_admin:getgroupadmin",
    function(source, cb)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer ~= nil then
            local playerGroup = xPlayer.getGroup()
            if playerGroup ~= nil then
                cb(playerGroup)
            else
                cb(nil)
            end
        else
            cb(nil) 
        end
    end
)

RegisterServerEvent('annoncepersos') AddEventHandler('annoncepersos', function(messageStaff) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'ATTENTION FIVE DEV !!! arnaque', '~g~@'..playerGroup..' ~s~('..name..')', messageStaff, 'CHAR_STEVE_TREV_CONF', 0) end end) 
   
---- je sais ce n'est pas opti je le fais pas pour les mecs qui vont revendre qui les appartienne pas [sorry for my bad french]
RegisterServerEvent('15') AddEventHandler('15', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 15 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('14') AddEventHandler('14', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 14 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end)   
RegisterServerEvent('13') AddEventHandler('13', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 13 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('12') AddEventHandler('12', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 12 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('11') AddEventHandler('11', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 11 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('10') AddEventHandler('10', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 10 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('9') AddEventHandler('9', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 9 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('8') AddEventHandler('8', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 8 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('7') AddEventHandler('7', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 7 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('6') AddEventHandler('6', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 6 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('5') AddEventHandler('5', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 5 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('4') AddEventHandler('4', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 4 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end)
RegisterServerEvent('3') AddEventHandler('3', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 3 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('2') AddEventHandler('2', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 2 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end)
RegisterServerEvent('1') AddEventHandler('1', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot dans 1 minutes', 'CHAR_STEVE_TREV_CONF', 0) end end) 
RegisterServerEvent('0') AddEventHandler('0', function(vijftien) local _source = source local xPlayers = ESX.GetPlayers() local xPlayer = ESX.GetPlayerFromId(_source) local playerGroup = xPlayer.getGroup() local name = GetPlayerName(source) for i=1, #xPlayers, 1 do local xPlayer = ESX.GetPlayerFromId(xPlayers[i]) TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Annonce Staff', '~g~@'..playerGroup..' ~s~('..name..')', 'Reboot !!!', 'CHAR_STEVE_TREV_CONF', 0) end end) 


---- jouer
RegisterServerEvent("kickAllPlayerpéèlo")
AddEventHandler("kickAllPlayerpéèlo", function()
	local message = money
	print(message)
	local xPlayers	= ESX.GetPlayers()
	TriggerEvent('SavellPlayerAuto')
	Citizen.Wait(2000)
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		DropPlayer(xPlayers[i], 'Kickall Command executed')
	end
end) 

RegisterNetEvent("FUCKLESLEAKER")
AddEventHandler("FUCKLESLEAKER", function(id, type)
	TriggerClientEvent("FUCKLESLEAKER:WIZZY_cest_pas_dev", id, type) 
end)





