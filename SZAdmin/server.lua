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
	function(target)
		local user, nick, ip, serial, hp, armor, money, skin, team, int, dim, vehOwner, vehName, vehHp, vehModel, checkBank, cardDep, cardNum, cardLvl = exports.SZMisc:_get("admin", "load", target)
		triggerClientEvent(source, "[SZAdmin]:showInfo", source, user, nick, ip, serial, hp, armor, money, skin, team, int, dim, vehOwner, vehName, vehHp, vehModel, checkBank, cardDep, cardNum, cardLvl) 
	end
)

addEvent("[SZAdmin]:bankAdmin", true)
addEventHandler("[SZAdmin]:bankAdmin", getRootElement(), 
	function(data, staffName, amount, whatDo, lvl)
		local target = getAccountName(getPlayerAccount(data))
		local staffacc = getAccountName(getPlayerAccount(source))
		local staffName = getPlayerName(source)
		local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?", target)
		local u, nick, ip, serial = exports.SZMisc:_get("user", "getSomePlayerInfo", source)
		local date = exports.SZMisc:_fecha()
		local reason, deposited, actualLvl
		if check then 
			deposited = check.Depositado
			actualLvl = check.Lvl
		end

		if whatDo == "dep" or whatDo == "ext" then reason = bankDepExt(data, staffName, amount, whatDo, target, deposited)
		elseif whatDo == "givedel" then reason = bankGiveDel(data, staffName, target, ip, serial, date)
		elseif whatDo == "changelvl" then
			if lvl ~= actualLvl then
				reason = bankChangeLvl(data, staffName, target, check.Lvl, lvl)
			else exports.SZMisc:_msgsv("admin", "err", "bankalreadythatlvl", source)
			end
		end
		
		if reason == "[NewExt]" or reason == "[NewDep]" then
			if reason == "[NewExt]" then amount = "-"..amount end
			exports.SZSQL:_Exec("INSERT INTO staffbanklog(Usuario, Target, LastDeposited, Amount, NewDeposited, Reason, Date) VALUES(?, ?, ?, ?, ?, ?, ?)", staffacc, target, deposited, amount, amount+deposited, reason, date)
		elseif reason == "[ChangeLvl]" then
			exports.SZSQL:_Exec("INSERT INTO staffbanklog(Usuario, Target, OldLvl, NewLvl, Reason, Date) VALUES(?, ?, ?, ?, ?, ?)", staffacc, target, actualLvl, lvl, reason, date)
		else
			exports.SZSQL:_Exec("INSERT INTO staffbanklog(Usuario, Target, Reason, Date) VALUES(?, ?, ?, ?)", staffacc, target, reason, date)
		end
	end
)

--Main functions
function bankDepExt(data, staffName, amount, whatDo, target, checkDep)	
	local newDep, reason
	if whatDo == "dep" then
		if checkDep + amount < 2147483278 then 
			newDep = checkDep + amount 
			reason = "[NewDep]" 
		end
	elseif whatDo == "ext" then
		if checkDep - amount > 0 then 
			newDep = checkDep - amount 
			reason = "[NewExt]" 
		end
	end

	if newDep then
		if whatDo == "dep" then exports.SZMisc:_msgsvstaff("bankdep", staffName, amount, data)
		else exports.SZMisc:_msgsvstaff("bankext", staffName, amount, 0, data)
		end
		exports.SZSQL:_Exec("UPDATE bank SET Depositado=? WHERE Usuario = ?", newDep, target)
		triggerClientEvent(source, "[SZAdmin]:refreshDep", source, "$"..newDep)
	else exports.SZMisc:_msgsv("admin", "err", "bankmin", source)
	end
	
	return reason
end

function bankGiveDel(data, staffName, target, ip, serial, date)
	local reason
	local check = exports.SZMisc:_get("bank", "getPlayerCard", data)
	if check then
		exports.SZSQL:_Exec("DELETE FROM bank WHERE Usuario = ?", target)
		triggerClientEvent(source, "[SZAdmin]:AdmininstrateCard", source, "No")
		triggerClientEvent(source, "[SZAdmin]:refreshTar", source, "No", "N/A", "N/A", "N/A")
		exports.SZMisc:_msgsvstaff("bankdelCard", staffName, 0, 0, data)
		reason = "[DelCard]"
	else
		local n = math.random(1, 999999999)
		local checkN = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Tarjeta = ?", n)
		if not checkN then
			exports.SZSQL:_Exec("INSERT INTO bank(Usuario, Depositado, Tarjeta, Lvl, Obtenida, IP, Serial) VALUES(?, ?, ?, ?, ?, ?, ?)", target, 0, n, "Normal", date, ip, serial)
			triggerClientEvent(source, "[SZAdmin]:AdmininstrateCard", source, "Yes")
			triggerClientEvent(source, "[SZAdmin]:refreshTar", source, "Sí", "$0", 'Normal', n)
			exports.SZMisc:_msgsvstaff("bankgiveCard", staffName, 0, 0, data)
			reason = "[GiveCard]"
		else
			bankGiveDel(data, staffName, target, ip, serial, date)
		end
	end

	return reason
end

function bankChangeLvl(data, staffName, target, checkLvl, lvl)
	exports.SZSQL:_Exec("UPDATE bank SET Lvl=? WHERE Usuario = ?", lvl, target)
	triggerClientEvent(source, "[SZAdmin]:refreshLvl", source, lvl)
	exports.SZMisc:_msgsvstaff("bankchglvl", staffName, 0, lvl, data)

	return "[ChangeLvl]"
end