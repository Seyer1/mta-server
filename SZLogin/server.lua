function abrir()
	if isGuestAccount(getPlayerAccount(source)) then
		triggerClientEvent(source, "[SZLogin]:abrir", source)
	end
end
addEventHandler("onPlayerJoin", getRootElement(), abrir)
addEventHandler("onPlayerLogout", getRootElement(), abrir)

addEvent("[SZLogin]:register", true)
addEventHandler("[SZLogin]:register", getRootElement(),
	function(thePlayer, u, p1)
		if isGuestAccount(getPlayerAccount(thePlayer)) then
			local check, nick, ip, serial, checkS, cuentaOriginal = exports.SZMisc:_get("user", "reg", thePlayer)
			local fecha = exports.SZMisc:_fecha()
			if not check and not getAccount(u) then
				if not checkS then
					local sha = tostring(sha256(p1))
					if addAccount(tostring(u), sha) then
						exports.SZSQL:_Exec("INSERT INTO users(Usuario, Password, IP, Serial, Registro, UltimaConexion) VALUES(?, ?, ?, ?, ?, ?)",u, sha, ip, serial, fecha, fecha)
						exports.SZMisc:_msgsv("login", "info", "reg", thePlayer)
						logIn(thePlayer, getAccount(u), sha)
						local x,y,z,xr,yr,zr,skin,team,dinero = exports.SZMisc:_get("user", "firstSpawn", thePlayer)
						spawnPlayer(thePlayer, x, y, z, xr, yr, zr)
						setElementModel(thePlayer, skin)
						setPlayerTeam(thePlayer, team)
						givePlayerMoney(thePlayer, dinero)
						triggerClientEvent(thePlayer, "[SZLogin]:cerrar", thePlayer)
					else exports.SZMisc:_msgsv("gral", "err", "sv", thePlayer)
					end
				else	
					exports.SZMisc:_msgsv("login", "err", "serial")
					exports.SZSQL:_Exec("INSERT INTO usersregduplog(Nickname, CuentaOriginal, IP, Serial, Fecha) VALUES(?, ?, ?, ?, ?)", nick, cuentaOriginal, ip, serial, fecha)
				end
			else exports.SZMisc:_msgsv("login", "err", "existe", thePlayer)
			end
		else exports.SZMisc:_msgsv("login", "err", "on")
		end
	end
)

addEvent("[SZLogin]:login", true)
addEventHandler("[SZLogin]:login", getRootElement(),
	function(thePlayer, u, pw)
		local checkUser, checkIP, checkS, checkPw, checkR = exports.SZMisc:_loginget(u)
		local nick, ip, serial = getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer)
		if getAccount(u) then
			local fecha = exports.SZMisc:_fecha()
			if (checkS == serial) and (checkPw == tostring(sha256(pw))) then
				logIn(thePlayer, getAccount(u),tostring(sha256(pw)))
				triggerClientEvent(thePlayer, "[SZLogin]:cerrar", thePlayer)
				exports.SZMisc:_msgsv("login", "info", "logged-in", thePlayer)
				exports.SZSQL:_Exec("UPDATE users SET UltimaConexion = ? WHERE Usuario = ?", fecha, u)
			elseif (checkS ~= serial) and (checkPw == tostring(sha256(pw))) then
				exports.SZMisc:_msgsv("login", "err", "pc", thePlayer)
				exports.SZSQL:_Exec("INSERT INTO usersloginseriallog(Nickname, IP, Serial, Usuario, IPOriginal, SerailOriginal, Fecha) VALUES(?, ?, ?, ?, ?, ?, ?)",nick, ip, serial, checkUser, checkIP, checkS, fecha)
			else
				exports.SZMisc:_msgsv("login", "err", "pwinv", thePlayer)
			end
		else
			exports.SZMisc:_msgsv("login", "err", "no", thePlayer)
		end
	end
)