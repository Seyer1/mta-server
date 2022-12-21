addEvent("[SZAdmin]:checkStaff", true)
addEventHandler("[SZAdmin]:checkStaff", getRootElement(), 
	function(thePlayer)
		if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup("Console")) then
			triggerClientEvent(thePlayer, "[SZAdmin]:abrir", thePlayer)
		end
	end
)

addEvent("[SZAdmin]:getInfo", true)
addEventHandler("[SZAdmin]:getInfo", root,
	function(data)
		local u, nick, ip, serial, hp, armor, money, skin, team, int, dim, vehOwner, vehName, vehHp, vehModel, checkBank, cardDep, cardNum, cardLvl = exports.SZMisc:_get("admin", "load", data)
		triggerClientEvent(source, "[SZAdmin]:showInfo", source, u, nick, ip, serial, hp, armor, money, skin, team, int, dim, vehOwner, vehName, vehHp, vehModel, checkBank, cardDep, cardNum, cardLvl) 
	end
)

addEvent("[SZAdmin]:bankAdmin", true)
addEventHandler("[SZAdmin]:bankAdmin", getRootElement(), 
	function(data, staffName, cant, modo, lvl)
		local target = getAccountName(getPlayerAccount(data))
		local staffacc = getAccountName(getPlayerAccount(source))
		local staffName = getPlayerName(source)
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?", target)
		local u, ip, serial = exports.SZMisc:_get("admin", "staffInfo", source)
		local fecha = exports.SZMisc:_fecha()
		local reason
		if modo == "dep" or modo == "ext" then reason = bankDepExt(data, staffName, cant, modo, target, check.Depositado)
		elseif modo == "givedel" then reason = bankGiveDel(data, staffName, target, ip, serial, fecha)
		elseif modo == "changelvl" then reason = bankChangeLvl(data, staffName, target, check.Lvl, lvl)
		end
		exports.SZSQL:_Exec("INSERT INTO staffbanklog(Usuario, Target, Cant, Motivo, Fecha) VALUES(?, ?, ?, ?, ?)", staffacc, target, cant, reason.."", fecha)
	end
)

function bankDepExt(data, staffName, cant, modo, target, checkDepositado)	
	local newDep, reason
	if modo == "dep" then
		if checkDepositado + cant < 2147483278 then 
			newDep = checkDepositado + cant 
			reason = "[NewDep]" 
		end
	elseif modo == "ext" then
		if checkDepositado - cant > 0 then 
			newDep = checkDepositado - cant 
			reason = "[NewExt]" 
		end
	end

	if newDep then
		if modo == "dep" then exports.SZMisc:_msgsvstaff("bankdep", staffName, cant, data)
		else exports.SZMisc:_msgsvstaff("bankext", staffName, cant, 0, data)
		end
		exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", newDep, target)
		triggerClientEvent(source, "[SZAdmin]:refreshDep", source, newDep)
	else exports.SZMisc:_msgsv("admin", "err", "bankmin", source)
	end
	
	return reason
end

function bankGiveDel(data, staffName, target, ip, serial, fecha)
	local reason
	local check = exports.SZMisc:_get("bank", "check", data)
	if check then
		exports.SZSQL:_Exec("DELETE FROM bank WHERE Usuario = ?", target)
		triggerClientEvent(source, "[SZAdmin]:AdmininstrateCard", source, "del")
		triggerClientEvent(source, "[SZAdmin]:refreshTar", source, "No", "N/A", "N/A", "N/A")
		exports.SZMisc:_msgsvstaff("bankdelCard", staffName, 0, 0, data)
		reason = "[DelCard]"
	else
		local n = math.random(1, 999999999)
		local checkN = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Tarjeta = ?", n)
		if not checkN then
			exports.SZSQL:_Exec("INSERT INTO bank(Usuario, Depositado, Tarjeta, Lvl, Obtenida, IP, Serial) VALUES(?, ?, ?, ?, ?, ?, ?)", target, 0, n, "Normal", fecha, ip, serial)
			triggerClientEvent(source, "[SZAdmin]:AdmininstrateCard", source, "give")
			triggerClientEvent(source, "[SZAdmin]:refreshTar", source, "Sí", "$0", 'Normal', n)
			exports.SZMisc:_msgsvstaff("bankgiveCard", staffName, 0, 0, data)
			reason = "[GiveCard]"
		else
			bankGiveDel(data, staffName, target, ip, serial, fecha)
		end
	end

	return reason
end

function bankChangeLvl(data, staffName, target, checkLvl, lvl)
	local reason = "[ChangeLvl]"
	if lvl ~= checkLvl then
		exports.SZSQL:_Exec("UPDATE bank SET Lvl=? WHERE Usuario = ?", lvl, target)
		triggerClientEvent(getRootElement(), "[SZAdmin]:refreshLvl", getRootElement(), lvl)
		exports.SZMisc:_msgsvstaff("bankchglvl", staffName, 0, lvl, data)
	else exports.SZMisc:_msgsv("admin", "err", "bankalreadythatlvl", source)
	end

	return reason
end