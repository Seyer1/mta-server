local Principal = createMarker (246.43359375, 118.5908203125, 1002.21875, "cylinder", 1.2, 250, 250, 7, 120, getRootElement())
setElementDimension(Principal, 1)  
setElementInterior(Principal, 10)

local ConseguirTarjeta = createMarker(251.6865234375, 117.45703125, 1002.21875, "cylinder", 1.2, 250, 250, 7, 120, getRootElement())
setElementDimension(ConseguirTarjeta, 1)  
setElementInterior(ConseguirTarjeta, 10)

-----------------------------------------------------------------------------------------		M		A		I		N		---------------------------------------------------------------------------------
addEventHandler("onMarkerHit", root,
	function(thePlayer)
		if getElementType(thePlayer) == "player" and not isPedInVehicle(thePlayer) then
			local check = exports.SZMisc:_get("bank", "check", thePlayer)
			if check then
				if (source == Principal) then
					local dep = exports.SZMisc:_get("bank", "refresh", thePlayer)
					triggerClientEvent(thePlayer, "[SZBank]:refreshDep", thePlayer, dep, dep)
					triggerClientEvent(thePlayer, "[SZBank]:open", thePlayer)
				elseif (source == ConseguirTarjeta) then exports.SZMisc:_msgsv("bank", "err", "already", thePlayer)
				end
			else
				if (source == Principal) then exports.SZMisc:_msgsv("bank", "err", "n/a", thePlayer)
				elseif (source == ConseguirTarjeta) then triggerClientEvent(thePlayer, "[SZBank]:get", thePlayer)
				end
			end
		end
	end
)

function confirmar(thePlayer)
	if getPlayerMoney(thePlayer) >= 50000 then
		local cardNum = math.random(1, 999999999)
		local checkNum = exports.SZSQL:_QuerySingle("SELECT Tarjeta FROM bank WHERE Tarjeta = ?", cardNum)
		if not checkNum then
			local date = exports.SZMisc:_fecha()
			local user, nick, ip, serial = exports.SZMisc:_get("user", "some", thePlayer)
			exports.SZSQL:_Exec("INSERT INTO bank(Usuario, Tarjeta, IP, Serial, Obtenida) VALUES(?, ?, ?, ?, ?)", user, cardNum, ip, serial, date)
			exports.SZMisc:_msgsv("bank", "info", "newCard", thePlayer)
			takePlayerMoney(thePlayer, 50000)
		else confirmar(thePlayer)
		end
	else exports.SZMisc:_msgsv("bank", "err", "amount", thePlayer)
	end
end
addEvent("[SZBank]:confirm", true)
addEventHandler("[SZBank]:confirm", getRootElement(), confirmar)

addEvent("[SZBank]:depext", true)
addEventHandler("[SZBank]:depext", getRootElement(),
	function(thePlayer, amount, whatDo)
		local user, ip, serial, actualDep, money = exports.SZMisc:_get("bank", "all", thePlayer)
		triggerClientEvent(thePlayer, "[SZBank]:refreshDep", thePlayer, actualDep)
		local date = exports.SZMisc:_fecha()

		if validar(amount, thePlayer) then
			local newDep
			if (actualDep + amount <= 2147483278 and whatDo == "depsv" and money >= amount) then
				newDep = actualDep + amount
				takePlayerMoney(thePlayer, amount)
				exports.SZSQL:_Exec("INSERT INTO bankdeplog(Usuario, Monto, Fecha, IP, Serial) VALUES(?, ?, ?, ?, ?)", user, amount, date, ip, serial)
			elseif (amount + money <= 99999999 and whatDo == "extsv" and actualDep >= amount) then
				newDep = actualDep - amount
				givePlayerMoney(thePlayer, amount)
				exports.SZSQL:_Exec("INSERT INTO bankextlog(Usuario, Monto, Fecha, IP, Serial) VALUES(?, ?, ?, ?, ?)", user, amount, date, ip, serial)
			else 
				if actualDep < amount or money < amount then exports.SZMisc:_msgsv("bank", "err", "amount", thePlayer)
				else exports.SZMisc:_msgsv("bank", "err", "max", thePlayer)
				end
			end
			if newDep then
				exports.SZSQL:_Exec("UPDATE bank SET Depositado = ?, UltimaTransaccion = ? WHERE Usuario = ?", newDep, date, user)
				triggerClientEvent(thePlayer, "[SZBank]:refreshDep", thePlayer, newDep)
			end
		end
	end
)

function validar(amount, thePlayer)
	if tonumber(amount) then
		if tonumber(amount) >= 1 then
			return true
		else
			exports.SZMisc:_msgsv("bank", "err", "min", thePlayer)
		end
	else
		exports.SZMisc:_msgsv("gral", "err", "num", thePlayer)
	end
end
