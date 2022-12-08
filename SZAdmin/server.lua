addEvent("[SZAdmin]:checkStaff", true)
addEventHandler("[SZAdmin]:checkStaff", getRootElement(), 
	function(thePlayer)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
			triggerClientEvent(source, "[SZAdmin]:abrir", source)
		end
	end
)

addEvent("[SZAdmin]:loadServer", true)
addEventHandler("[SZAdmin]:loadServer", root,
	function(data)
		if data then
			if getElementType(data) == "player" then
			local account = getAccountName(getPlayerAccount(data))
			local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",account)
			local nick = getPlayerName(data)
			local IP = getPlayerIP(data) or "Denied"
			local SERIAL = getPlayerSerial(data)
			local health = getElementHealth(data).."%"
			local armour = getPedArmor(data)
			local money = "$"..getPlayerMoney(data)
			local skin = getElementModel(data)
			local team = getTeamName(getPlayerTeam(data))
			local dimension = getElementDimension(data)
			local interior = getElementInterior(data)
			local vehicle = getPedOccupiedVehicle(data)
				if (check ~= nil) then
					tt = "Sep"
					tipo = check.Lvl
					numero = check.Numero
					dep = "$"..check.Depositado
					triggerClientEvent(source, "[SZAdmin]:TT", source, tipo)
				else
					tt = "Nope"
					tipo = "N/A"
					numero = "N/A"
					dep = "N/A"
					triggerClientEvent(source, "[SZAdmin]:NT", source)
				end
				if not vehicle then
					vehicle_name = "Nope"
					vehicle_health = "N/A"
					vehicle_id = "N/A"
					vehicle_owner = "N/A"
				else
					vehicle_name = "Sep, en un "..getVehicleName(vehicle)
					vehicle_health = getElementHealth(vehicle).."%"
					vehicle_id = getElementModel(vehicle)
					vehicle_owner = "N/A"
				end
				if armour >= 1 then
					armour = getPedArmor(data).."%"
				else
					armour = "Nope"
				end
				triggerClientEvent(source, "[SZAdmin]:loadClient", source, nick, account, IP, SERIAL, health, armour, money, skin, team, dimension, interior, vehicle_name, vehicle_health, vehicle_id, vehicle_owner, tt, tipo, numero, dep)
			end
		end
	end
) 

addEvent("[SZAdmin]:delTarjeta", true)
addEventHandler("[SZAdmin]:delTarjeta", getRootElement(),
	function(data, staffName)
	local acc = getAccountName(getPlayerAccount(data))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
		outputChatBox("#ffff00[Server] El staff "..staffName.." eliminó tu tarjeta.", data, 255, 255, 255, true)
		exports.SZSQL:_Exec("DELETE FROM bank WHERE Usuario = ?", acc)
		exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Deleted,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Delete] El staff ["..staff.."] le eliminó la tarjeta a ["..acc.."] correctamente.")
		triggerClientEvent(getRootElement(), "[SZAdmin]:NT", getRootElement())
		local checkAgain = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
			if (checkAgain == nil) then
				checkT = "Nope"
				checkD = "N/A"
				checkL = "N/A"
				checkN = "N/A"
			end
		triggerClientEvent(source, "[SZAdmin]:refTarDel", source, checkT, checkD, checkL, checkN)
	end
)

addEvent("[SZAdmin]:darTarjeta", true)
addEventHandler("[SZAdmin]:darTarjeta", getRootElement(), 
	function(data, staffName)
	local n = math.random(150887371, 444458214)
	local acc = getAccountName(getPlayerAccount(data))
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local checkN = exports.SZSQL:_QuerySingle("SELECT Numero FROM bank WHERE Numero = ?",n)
		if checkN ~= n then
			exports.SZSQL:_Exec("INSERT INTO bank(Numero,Usuario,Lvl,Depositado) VALUES(?,?,?,?)",n,acc,"Normal",0)
			exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Regalo,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Regalo] El staff ["..staff.."] le regaló una tarjeta a ["..acc.."] correctamente.")
			outputChatBox("#ffff00[Server] El staff "..staffName.." te regaló una tarjeta.", data, 255, 255, 255, true)
			local checkAgain = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
			local checkT = "Sep"
			local checkD = checkAgain.Depositado
			local checkLvl = checkAgain.Lvl
			local checkN = checkAgain.Numero
			triggerClientEvent(getRootElement(), "[SZAdmin]:refreshTar", getRootElement(), checkT, checkD, checkLvl, checkN)
			triggerClientEvent(getRootElement(), "[SZAdmin]:TT", getRootElement())
		end
	end
)

addEvent("[SZAdmin]:addDep", true)
addEventHandler("[SZAdmin]:addDep", getRootElement(),
	function(data, staffName, t)
	local acc = getAccountName(getPlayerAccount(data))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local checkDepositado = check.Depositado
	local new = checkDepositado + t
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
		if new < 9223372036854775807 then
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, acc)
			exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Deposito,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Deposito] El staff ["..staff.."] le agregó $"..t.." a la la cuenta bancaria de ["..acc.."] correctamente.")
			outputChatBox("#ffff00[Server] El staff "..staffName.." agregó $"..t.." a tu cuenta bancaria.", data, 255, 255, 255, true)
			outputChatBox("#ffff00[Info] Tu nuevo total es $"..new..".", data, 255, 255, 255, true)
			triggerClientEvent(getRootElement(), "[SZAdmin]:refreshDep", getRootElement(), new)
		else
			outputChatBox("#DD0606[Error]#FFFFFF El usuario excede el límite de dinero, depositale menos.", source, 255, 255, 255, true)
		end
	end
)

addEvent("[SZAdmin]:extDep", true)
addEventHandler("[SZAdmin]:extDep", getRootElement(),
	function(data, staffName, t)
	local acc = getAccountName(getPlayerAccount(data))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local checkDepositado = check.Depositado
	local new = checkDepositado - t
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
		if new >= 0 then
			exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", new, acc)
			exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Extraccion,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Extraccion] El staff ["..staff.."] le quitó $"..t.." a la la cuenta bancaria de ["..acc.."] correctamente.")
			outputChatBox("#ffff00[Server] El staff "..staffName.." te quitó $"..t.." de tu cuenta bancaria.", data, 255, 255, 255, true)
			outputChatBox("#ffff00[Info] Tu nuevo total es $"..new..".", data, 255, 255, 255, true)
			triggerClientEvent(getRootElement(), "[SZAdmin]:refreshDep", getRootElement(), new)
		else
			outputChatBox("#DD0606[Error]#FFFFFF El usuario no puede quedar con un depósito negativo.", source, 255, 255, 255, true)
		end
	end
)

addEvent("[SZAdmin]:actNormal", true)
addEventHandler("[SZAdmin]:actNormal", getRootElement(),
	function(data, staffName)
	local acc = getAccountName(getPlayerAccount(data))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local checkNivel = check.Lvl
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
	local level = "Normal"
		if level ~= checkNivel then
			exports.SZSQL:_Exec("UPDATE bank SET Lvl=? WHERE Usuario = ?", level, acc)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
			local new = checkNew.Lvl
			exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Level,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Level] El staff ["..staff.."] actualizó la tarjeta de ["..acc.."] del nivel ["..checkNivel.."] al ["..new.."] correctamente.")
			triggerClientEvent(getRootElement(), "[SZAdmin]:refreshLvl", getRootElement(), new)
			outputChatBox("#ffff00[Server] El staff "..staffName.." actualizó tu tarjeta a 'Normal'.", data, 255, 255, 255, true)
		else
			outputChatBox("#DD0606[Error]#FFFFFF El usuario ya tiene esa tarjeta.", source, 255, 255, 255, true)
		end
	end
)
-----------[Cambiar lvl a gold]-----------
addEvent("[SZAdmin]:actGold", true)
addEventHandler("[SZAdmin]:actGold", getRootElement(), 
	function(data, staffName)
	local acc = getAccountName(getPlayerAccount(data))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local checkNivel = check.Lvl
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
	local level = "Gold"
		if level ~= checkNivel then
			exports.SZSQL:_Exec("UPDATE bank SET Lvl=? WHERE Usuario = ?", level, acc)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
			local new = checkNew.Lvl
			exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Level,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Level] El staff ["..staff.."] actualizó la tarjeta de ["..acc.."] del nivel ["..checkNivel.."] al ["..new.."] correctamente.")
			triggerClientEvent(getRootElement(), "[SZAdmin]:refreshLvl", getRootElement(), new)
			message("#ffff00[Server] El staff "..staffName.." actualizó tu tarjeta a 'Gold'.", data, 255, 255, 255, true)
			message("#ffff00[Info] Ahora tenes 7,5% de descuento en todas tus compras!", data, 255, 255, 255, true)
		else
			outputChatBox("#DD0606[Error]#FFFFFF El usuario ya tiene esa tarjeta.", source, 255, 255, 255, true)
		end
	end
)

-----------[Cambiar lvl a platinum]-----------
addEvent("[SZAdmin]:actPlatinum", true)
addEventHandler("[SZAdmin]:actPlatinum", getRootElement(),
	function(data, staffName)
	local acc = getAccountName(getPlayerAccount(data))
	local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
	local checkNivel = check.Lvl
	local ip = getPlayerIP(source)
	local serial = getPlayerSerial(source)
	local staff = getAccountName(getPlayerAccount(source))
	local level = "Platinum"
		if level ~= checkNivel then
			exports.SZSQL:_Exec("UPDATE bank SET Lvl=? WHERE Usuario = ?", level, acc)
			local checkNew = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?",acc)
			local new = checkNew.Lvl
			exports.SZSQL:_Exec("INSERT INTO adminlog(Usuario,IP,Serial,Bank,Level,Text) VALUES(?,?,?,?,?,?)",staff,ip,serial,"Sep","Sep","[Level] El staff ["..staff.."] actualizó la tarjeta de ["..acc.."] del nivel ["..checkNivel.."] al ["..new.."] correctamente.")
			triggerClientEvent(getRootElement(), "[SZAdmin]:refreshLvl", getRootElement(), new)
			message("#ffff00[Server] El staff "..staffName.." actualizó tu tarjeta a 'Platinum'.", data, 255, 255, 255, true)
			message("#ffff00[Info] Ahora tenes 15% de descuento en todas tus compras!", data, 255, 255, 255, true)
		else
			outputChatBox("#DD0606[Error]#FFFFFF El usuario ya tiene esa tarjeta.", source, 255, 255, 255, true)
		end
	end
)