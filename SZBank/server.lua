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
					local dep = exports.SZMisc:_get("bank", "act", thePlayer)
					triggerClientEvent(thePlayer, "[SZBank]:actualizar", thePlayer, dep, dep)
					triggerClientEvent(thePlayer, "[SZBank]:abrir", thePlayer)
				elseif (source == ConseguirTarjeta) then exports.SZMisc:_msgsv("bank", "err", "ya", thePlayer)
				end
			else
				if (source == Principal) then exports.SZMisc:_msgsv("bank", "err", "some", thePlayer)
				elseif (source == ConseguirTarjeta) then triggerClientEvent(thePlayer, "[SZBank]:conseguir", thePlayer)
				end
			end
		end
	end
)

function confirmar(thePlayer)
	if getPlayerMoney(thePlayer) >= 50000 then
		local n = math.random(1, 999999999)
		local checkN = exports.SZSQL:_QuerySingle("SELECT Tarjeta FROM bank WHERE Tarjeta = ?", n)
		if not checkN then
			local fecha = exports.SZMisc:_fecha()
			local u, ip, serial = exports.SZMisc:_get("user", "some", thePlayer)
			exports.SZSQL:_Exec("INSERT INTO bank(Usuario, Tarjeta, IP, Serial, Obtenida) VALUES(?, ?, ?, ?, ?)", u, n, ip, serial, fecha)
			exports.SZMisc:_msgsv("bank", "info", "nuevaTarjeta", thePlayer)
			takePlayerMoney(thePlayer, 50000)
		else confirmar(thePlayer)
		end
	else exports.SZMisc:_msgsv("bank", "err", "cant", thePlayer)
	end
end
addEvent("[SZBank]:confirm", true)
addEventHandler("[SZBank]:confirm", getRootElement(), confirmar)

addEvent("[SZBank]:depext", true)
addEventHandler("[SZBank]:depext", getRootElement(),
	function(thePlayer, cant, modo)
		local u, ip, serial, dep, money = exports.SZMisc:_get("bank", "todo", thePlayer)
		triggerClientEvent(thePlayer, "[SZBank]:actualizar", thePlayer, dep)
		local fecha = exports.SZMisc:_fecha()

		if validar(cant, thePlayer) then
			if (dep + cant <= 2147483278 and modo == "dep" and money >= cant) then
				new = dep + cant
				takePlayerMoney(thePlayer, cant)
				exports.SZSQL:_Exec("INSERT INTO bankdeplog(Usuario, Monto, Fecha, IP, Serial) VALUES(?, ?, ?, ?, ?)", u, cant, fecha, ip, serial)
			elseif (cant + money <= 99999999 and modo == "ext" and dep >= cant) then
				new = dep - cant
				givePlayerMoney(thePlayer, cant)
				exports.SZSQL:_Exec("INSERT INTO bankextlog(Usuario, Monto, Fecha, IP, Serial) VALUES(?, ?, ?, ?, ?)", u, cant, fecha, ip, serial)
			else 
				if dep < cant or money < cant then exports.SZMisc:_msgsv("bank", "err", "cant", thePlayer)
				else exports.SZMisc:_msgsv("bank", "err", "max", thePlayer)
				end
			end
			if new then
				exports.SZSQL:_Exec("UPDATE bank SET Depositado = ?, UltimaTransaccion = ? WHERE Usuario = ?", new, fecha, u)
				triggerClientEvent(thePlayer, "[SZBank]:actualizar", thePlayer, new)
			end
		end
	end
)

function validar(cant, thePlayer)
	if tonumber(cant) then
		if tonumber(cant) >= 1 then
			return true
		else
			exports.SZMisc:_msgsv("bank", "err", "monto", thePlayer)
		end
	else
		exports.SZMisc:_msgsv("gral", "err", "nro", thePlayer)
	end
end
