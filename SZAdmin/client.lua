loadstring(exports.DxLib:dgsImportFunction())()
--showCursor(true)

local sx, sy = guiGetScreenSize()
local resX, resY = 1333, 768
local x, y = (sx/resX), (sy/resY)

dx = {
	window = {},
	gridlist = {
		column = {}
	},
	tab = {
		column = {}
	},
	label = {},
	button = {},
	radio = {},
	edit = {}
}

dx.window[1] = dgsCreateWindow(x*150, y*0, x*683, y*447, "[SZAdmin] - by #Dv^ + Seyer", false, _, _, _, _, _, _, _, true); centerWindow(dx.window[1]); dgsSetVisible(dx.window[1], false)

dx.gridlist[1] = dgsCreateGridList(x*5, y*5, x*200, y*385, false, dx.window[1])
dx.gridlist.column[1] = dgsGridListAddColumn(dx.gridlist[1], "Players", 0.948)
dgsGridListSetSortEnabled(dx.gridlist[1], false)

dx.tab[1] = dgsCreateTabPanel(x*210, y*5, x*470, y*420, false, dx.window[1])-- x*20 => x*0 

dx.tab.column[1] = dgsCreateTab(" Players ", dx.tab[1])
dx.tab.column[2] = dgsCreateTab(" Bank ", dx.tab[1])
dx.tab.column[3] = dgsCreateTab(" Options ", dx.tab[1])

dx.button[1] = dgsCreateButton(x*5, y*394, x*200, y*30, "Refresh", false, dx.window[1], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))

-- #Players
dx.label[1] = dgsCreateLabel(x*15, y*20, x*100, y*15, "Player:", false, dx.tab.column[1])
dx.label[2] = dgsCreateLabel(x*25, y*45, x*100, y*15, "Nick: N/A", false, dx.tab.column[1])
dx.label[3] = dgsCreateLabel(x*25, y*65, x*100, y*15, "Account: N/A", false, dx.tab.column[1])
dx.label[4] = dgsCreateLabel(x*25, y*85, x*200, y*15, "IP: N/A", false, dx.tab.column[1])
dx.label[5] = dgsCreateLabel(x*25, y*105, x*300, y*35, "Serial: N/A", false, dx.tab.column[1])
dx.label[6] = dgsCreateLabel(x*15, y*130, x*100, y*15, "Info:", false, dx.tab.column[1])
dx.label[7] = dgsCreateLabel(x*25, y*155, x*100, y*15, "Health: N/A", false, dx.tab.column[1])
dx.label[8] = dgsCreateLabel(x*25, y*175, x*100, y*15, "Armor: N/A", false, dx.tab.column[1])
dx.label[9] = dgsCreateLabel(x*25, y*195, x*100, y*15, "Money: N/A", false, dx.tab.column[1])
dx.label[10] = dgsCreateLabel(x*25, y*215, x*100, y*15, "Skin ID: N/A", false, dx.tab.column[1])
dx.label[11] = dgsCreateLabel(x*25, y*235, x*100, y*15, "Team: N/A", false, dx.tab.column[1])
dx.label[12] = dgsCreateLabel(x*25, y*255, x*100, y*15, "Dimension: N/A", false, dx.tab.column[1])
dx.label[13] = dgsCreateLabel(x*25, y*275, x*100, y*15, "Interior: N/A", false, dx.tab.column[1])
dx.label[14] = dgsCreateLabel(x*15, y*300, x*100, y*15, "Vehicle:", false, dx.tab.column[1])
dx.label[15] = dgsCreateLabel(x*25, y*325, x*100, y*15, "¿Esta en un vehículo?: N/A", false, dx.tab.column[1])
dx.label[16] = dgsCreateLabel(x*25, y*345, x*100, y*15, "Health: N/A", false, dx.tab.column[1])
dx.label[17] = dgsCreateLabel(x*25, y*365, x*100, y*15, "ID: N/A", false, dx.tab.column[1])
dx.label[18] = dgsCreateLabel(x*25, y*385, x*100, y*15, "Owner: N/A", false, dx.tab.column[1])

dx.button[2] = dgsCreateButton(x*360, y*45, x*100, y*20, "Reconnect", false, dx.tab.column[1], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dx.button[3] = dgsCreateButton(x*360, y*70, x*100, y*20, "Ban", false, dx.tab.column[1], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))

-- #Bank
dx.label[19] = dgsCreateLabel(x*15, y*20, x*100, y*15, "Player:", false, dx.tab.column[2])
dx.label[20] = dgsCreateLabel(x*25, y*45, x*100, y*15, "Nick: N/A", false, dx.tab.column[2])
dx.label[21] = dgsCreateLabel(x*25, y*65, x*100, y*15, "Account: N/A", false, dx.tab.column[2])
dx.label[22] = dgsCreateLabel(x*25, y*85, x*200, y*15, "IP: N/A", false, dx.tab.column[2])
dx.label[23] = dgsCreateLabel(x*25, y*105, x*300, y*35, "Serial: N/A", false, dx.tab.column[2])
dx.label[24] = dgsCreateLabel(x*325, y*20, x*100, y*15, "Bank:", false, dx.tab.column[2])
dx.label[25] = dgsCreateLabel(x*335, y*45, x*300, y*35, "¿Tiene tarjeta?: N/A", false, dx.tab.column[2])
dx.label[26] = dgsCreateLabel(x*335, y*65, x*300, y*35, "Tipo de tarjeta: N/A", false, dx.tab.column[2])
dx.label[27] = dgsCreateLabel(x*335, y*85, x*300, y*35, "Número: N/A", false, dx.tab.column[2])
dx.label[28] = dgsCreateLabel(x*335, y*105, x*300, y*35, "Depositado: N/A", false, dx.tab.column[2])

dx.button[4] = dgsCreateButton(x*70, y*170, x*100, y*20, "Modificar depósito", false, dx.tab.column[2], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dx.button[5] = dgsCreateButton(x*185, y*170, x*100, y*20, "Modificar lvl", false, dx.tab.column[2], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dx.button[6] = dgsCreateButton(x*300, y*170, x*100, y*20, "Regalar/Eliminar tarjeta", false, dx.tab.column[2], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dx.button[7] = dgsCreateButton(x*185, y*350, x*100, y*20, "Actualizar", false, dx.tab.column[2], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dx.button[8] = dgsCreateButton(x*185, y*250, x*100, y*20, "Actualizar", false, dx.tab.column[2], _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))

dx.radio[1] = dgsCreateRadioButton(x*185, y*210, x*100, y*15, " Agregar a su depósito", false, dx.tab.column[2], tocolor(251, 55, 0, 255), _, _, _, _)
dx.radio[2] = dgsCreateRadioButton(x*185, y*280, x*100, y*15, " Quitarle a su depósito", false, dx.tab.column[2], tocolor(251, 55, 0, 255), _, _, _, _)
dx.radio[3] = dgsCreateRadioButton(x*70, y*210, x*100, y*15, " Actualizar a normal", false, dx.tab.column[2], tocolor(251, 55, 0, 255), _, _, _, _)
dx.radio[4] = dgsCreateRadioButton(x*190, y*210, x*100, y*15, " Actualizar a gold", false, dx.tab.column[2], tocolor(251, 55, 0, 255), _, _, _, _)
dx.radio[5] = dgsCreateRadioButton(x*300, y*210, x*100, y*15, " Actualizar a platinum", false, dx.tab.column[2], tocolor(251, 55, 0, 255), _, _, _, _)

dx.edit[1] = dgsCreateEdit(x*135, y*240, x*200, y*20, "", false, dx.tab.column[2])
dx.edit[2] = dgsCreateEdit(x*135, y*310, x*200, y*20, "", false, dx.tab.column[2])

dgsSetVisible(dx.radio[1], false)
dgsSetVisible(dx.radio[2], false)
dgsSetVisible(dx.radio[3], false)
dgsSetVisible(dx.radio[4], false)
dgsSetVisible(dx.radio[5], false)
dgsSetVisible(dx.edit[1], false)
dgsSetVisible(dx.edit[2], false)
dgsSetVisible(dx.button[7], false)
dgsSetVisible(dx.button[8], false)

--[[addEventHandler("onClientRender", root,
	function()
		dxDrawRectangle(x*525, y*105, x*300, y*15)
	end
)]]

local refresh = function() dgsGridListClear(dx.gridlist[1])
    for i, v in pairs(getElementsByType("player")) do
        local row = dgsGridListAddRow(dx.gridlist[1])
        dgsGridListSetItemText(dx.gridlist[1], row, dx.gridlist.column[1], getPlayerName(v))
        dgsGridListSetItemData(dx.gridlist[1], row, dx.gridlist.column[1], v)
    end
end

addEventHandler("onDgsMouseClick", dgsRoot,
	function(_, state)
	local item = dgsGridListGetSelectedItem(dx.gridlist[1])
	local staffName = getPlayerName(getLocalPlayer())
		if item and item ~= -1 then
		local data = dgsGridListGetItemData(dx.gridlist[1], item, dx.gridlist.column[1])
			if state == "down" then
				if source == dx.button[1] then
					dgsGridListClear(dx.gridlist[1])
					for i, v in pairs(getElementsByType("player")) do
						local row = dgsGridListAddRow(dx.gridlist[1])
						dgsGridListSetItemText(dx.gridlist[1], row, dx.gridlist.column[1], getPlayerName(v), false, false)
						dgsGridListSetItemData(dx.gridlist[1], row, dx.gridlist.column[1], v)
					end
				elseif source == dx.button[4] then
					dgsSetVisible(dx.radio[1], true)
					dgsSetVisible(dx.radio[2], true)
					dgsSetVisible(dx.radio[3], false)
					dgsSetVisible(dx.radio[4], false)
					dgsSetVisible(dx.radio[5], false)
					dgsSetVisible(dx.edit[1], true)
					dgsSetVisible(dx.edit[2], true)
					dgsSetVisible(dx.button[7], true)
					dgsSetVisible(dx.button[8], false)
				elseif source == dx.button[5] then
					dgsSetVisible(dx.radio[1], false)
					dgsSetVisible(dx.radio[2], false)
					dgsSetVisible(dx.radio[3], true)
					dgsSetVisible(dx.radio[4], true)
					dgsSetVisible(dx.radio[5], true)
					dgsSetVisible(dx.edit[1], false)
					dgsSetVisible(dx.edit[2], false)
					dgsSetVisible(dx.button[7], false)
					dgsSetVisible(dx.button[8], true)
				elseif source == dx.button[6] then
					local t = dgsGetText(dx.button[6])
					if t == "Eliminar tarjeta" then
						triggerServerEvent("[SZAdmin]:delTarjeta", localPlayer, data, staffName)
					else
						triggerServerEvent("[SZAdmin]:darTarjeta", localPlayer, data, staffName)
					end
				elseif source == dx.button[7] then
					if dgsRadioButtonGetSelected(dx.radio[1]) then
					local t = dgsGetText(dx.edit[1])
						if t then
							if tonumber(t) then
								if tonumber(t) >= 1 then
									triggerServerEvent("[SZAdmin]:addDep", localPlayer, data, staffName, t)
								else
									outputChatBox("#DD0606[Error]#FFFFFF La cantidad mínima es de un número mayor o igual a 1.", 255, 255, 255, true)
								end
							else
								outputChatBox("#DD0606[Error]#FFFFFF Solo números.", 255, 255, 255, true)
							end
						else
							outputChatBox("#DD0606[Error]#FFFFFF Completa el campo.", 255, 255, 255, true)
						end
					elseif dgsRadioButtonGetSelected(dx.radio[2]) then
						local t = dgsGetText(dx.edit[2])
						if t ~= "" then
							if tonumber(t) then
								if tonumber(t) >= 1 then
									triggerServerEvent("[SZAdmin]:extDep", localPlayer, data, staffName, t)
								else
									outputChatBox("#DD0606[Error]#FFFFFF La cantidad mínima es de un número mayor o igual a 1.", 255, 255, 255, true)
								end
							else
								outputChatBox("#DD0606[Error]#FFFFFF Solo números.", 255, 255, 255, true)
							end
						else
							outputChatBox("#DD0606[Error]#FFFFFF Completa el campo.", 255, 255, 255, true)
						end
					else
						outputChatBox("#DD0606[Error]#FFFFFF Selecciona alguna función.", 255, 255, 255, true)
					end
				elseif source == dx.button[8] then
					if dgsRadioButtonGetSelected(dx.radio[3]) then
						triggerServerEvent("[SZAdmin]:actNormal", localPlayer, data, staffName)
					elseif dgsRadioButtonGetSelected(dx.radio[4]) then
						triggerServerEvent("[SZAdmin]:actGold", localPlayer, data, staffName)
					elseif dgsRadioButtonGetSelected(dx.radio[5]) then
						triggerServerEvent("[SZAdmin]:actPlatinum", localPlayer, data, staffName)
					else
						message("#DD0606[Error]#FFFFFF Selecciona alguna función.", 255, 255, 255, true)
					end
				elseif source == dx.label[5] or source == dx.label[23] then
					local serial = dgsGetText(source):gsub("Serial: ", "")
					if serial ~= "N/A" then
						setClipboard(serial)
						print("Copied SERIAL!")
					end
				elseif source == dx.gridlist[1] then
					triggerServerEvent("[SZAdmin]:loadServer", localPlayer, data)
					dgsSetEnabled(dx.button[2], true)
					dgsSetEnabled(dx.button[3], true)
				end
			end
		else
			dgsSetText(dx.label[2], "Nick: N/A")
			dgsSetText(dx.label[3], "Account: N/A")
			dgsSetText(dx.label[4], "IP: N/A")
			dgsSetText(dx.label[5], "Serial: N/A")
			dgsSetText(dx.label[7], "Health: N/A")
			dgsSetText(dx.label[8], "Armor: N/A")
			dgsSetText(dx.label[9], "Money: N/A")
			dgsSetText(dx.label[10], "Skin ID: N/A")
			dgsSetText(dx.label[11], "Team: N/A")
			dgsSetText(dx.label[12], "Dimension: N/A")
			dgsSetText(dx.label[13], "Interior: N/A")
			dgsSetText(dx.label[15], "¿Esta en un vehículo?: N/A")
			dgsSetText(dx.label[16], "Health: N/A")
			dgsSetText(dx.label[17], "ID: N/A")
			dgsSetText(dx.label[18], "Owner: N/A")
			dgsSetText(dx.label[20], "Nick: N/A")
			dgsSetText(dx.label[21], "Account: N/A")
			dgsSetText(dx.label[22], "IP: N/A")
			dgsSetText(dx.label[23], "Serial: N/A")
			dgsSetText(dx.label[25], "¿Tiene tarjeta?: N/A")
			dgsSetText(dx.label[26], "Tipo de tarjeta: N/A")
			dgsSetText(dx.label[27], "Número: N/A")
			dgsSetText(dx.label[28], "Depositado: N/A")
			dgsSetText(dx.button[6], "Regalar/Eliminar tarjeta")
			dgsSetVisible(dx.radio[1], false)
			dgsSetVisible(dx.radio[2], false)
			dgsSetVisible(dx.radio[3], false)
			dgsSetVisible(dx.radio[4], false)
			dgsSetVisible(dx.radio[5], false)
			dgsSetVisible(dx.edit[1], false)
			dgsSetVisible(dx.edit[2], false)
			dgsSetVisible(dx.button[7], false)
			dgsSetVisible(dx.button[8], false)
			dgsSetEnabled(dx.button[2], false)
			dgsSetEnabled(dx.button[3], false)
			dgsSetEnabled(dx.button[4], false)
			dgsSetEnabled(dx.button[5], false)
			dgsSetEnabled(dx.button[6], false)
		end	
	end
)

addEvent("[SZAdmin]:loadClient", true)
addEventHandler("[SZAdmin]:loadClient", root,
	function(nick, account, IP, SERIAL, health, armour, money, skin, team, dimension, interior, vehicle_name, vehicle_health, vehicle_id, vehicle_owner, tt, tipo, numero, dep)
		---[Main]---
		dgsSetText(dx.label[2], "Nick: "..nick)
		dgsSetText(dx.label[3], "Account: "..account)
		dgsSetText(dx.label[4], "IP: "..tostring(IP))
		dgsSetText(dx.label[5], "Serial: "..SERIAL)
		dgsSetText(dx.label[7], "Health: "..health)
		dgsSetText(dx.label[8], "Armor: "..armour)
		dgsSetText(dx.label[9], "Money: "..money)
		dgsSetText(dx.label[10], "Skin ID: "..skin)
		dgsSetText(dx.label[11], "Team: "..team)
		dgsSetText(dx.label[12], "Dimension: "..dimension)
		dgsSetText(dx.label[13], "Interior: "..interior)
		dgsSetText(dx.label[15], "¿Esta en un vehículo?: "..vehicle_name)
		dgsSetText(dx.label[16], "Health: "..vehicle_health)
		dgsSetText(dx.label[17], "ID: "..vehicle_id)
		dgsSetText(dx.label[18], "Owner: "..vehicle_owner)
		---[Bank]---
		dgsSetText(dx.label[20], "Nick: "..nick)
		dgsSetText(dx.label[21], "Account: "..account)
		dgsSetText(dx.label[22], "IP: "..tostring(IP))
		dgsSetText(dx.label[23], "Serial: "..SERIAL)
		dgsSetText(dx.label[25], "¿Tiene tarjeta?: "..tt)
		dgsSetText(dx.label[26], "Tipo de tarjeta: "..tipo)
		dgsSetText(dx.label[27], "Número: "..numero)
		dgsSetText(dx.label[28], "Depositado: "..dep)
	end
)

bindKey("o", "down", 
	function()
		triggerServerEvent("[SZAdmin]:checkStaff", getLocalPlayer(),getLocalPlayer())
	end
)

addEvent("[SZAdmin]:abrir", true)
addEventHandler("[SZAdmin]:abrir", getLocalPlayer(),
	function()
	local visible = dgsGetVisible(dx.window[1])
		if (not visible) then
			dgsSetVisible(dx.window[1], true)
			showCursor(true)
			refresh()
			dgsSetEnabled(dx.button[2], false)
			dgsSetEnabled(dx.button[3], false)
			dgsSetEnabled(dx.button[4], false)
			dgsSetEnabled(dx.button[5], false)
			dgsSetEnabled(dx.button[6], false)
		else
			dgsSetVisible(dx.window[1], false)
			showCursor(false)
			dgsGridListClear(dx.gridlist[1])
			dgsSetVisible(dx.radio[1], false)
			dgsSetVisible(dx.radio[2], false)
			dgsSetVisible(dx.radio[3], false)
			dgsSetVisible(dx.radio[4], false)
			dgsSetVisible(dx.radio[5], false)
			dgsSetVisible(dx.edit[1], false)
			dgsSetVisible(dx.edit[2], false)
			dgsSetVisible(dx.button[7], false)
			dgsSetVisible(dx.button[8], false)
			dgsSetText(dx.label[2], "Nick: N/A")
			dgsSetText(dx.label[3], "Account: N/A")
			dgsSetText(dx.label[4], "IP: N/A")
			dgsSetText(dx.label[5], "Serial: N/A")
			dgsSetText(dx.label[7], "Health: N/A")
			dgsSetText(dx.label[8], "Armor: N/A")
			dgsSetText(dx.label[9], "Money: N/A")
			dgsSetText(dx.label[10], "Skin ID: N/A")
			dgsSetText(dx.label[11], "Team: N/A")
			dgsSetText(dx.label[12], "Dimension: N/A")
			dgsSetText(dx.label[13], "Interior: N/A")
			dgsSetText(dx.label[15], "¿Esta en un vehículo?: N/A")
			dgsSetText(dx.label[16], "Health: N/A")
			dgsSetText(dx.label[17], "ID: N/A")
			dgsSetText(dx.label[18], "Owner: N/A")
			dgsSetText(dx.label[20], "Nick: N/A")
			dgsSetText(dx.label[21], "Account: N/A")
			dgsSetText(dx.label[22], "IP: N/A")
			dgsSetText(dx.label[23], "Serial: N/A")
			dgsSetText(dx.label[25], "¿Tiene tarjeta?: N/A")
			dgsSetText(dx.label[26], "Tipo de tarjeta: N/A")
			dgsSetText(dx.label[27], "Número: N/A")
			dgsSetText(dx.label[28], "Depositado: N/A")
			dgsSetText(dx.button[6], "Regalar/Eliminar tarjeta")
		end
	end
)

addEvent("[SZAdmin]:NT", true)
addEventHandler("[SZAdmin]:NT", getLocalPlayer(),
	function()
		dgsSetEnabled(dx.button[4], false)
		dgsSetEnabled(dx.button[5], false)
		dgsSetEnabled(dx.button[6], true)
		dgsSetText(dx.button[6], "Regalar tarjeta")
	end
)

addEvent("[SZAdmin]:TT", true)
addEventHandler("[SZAdmin]:TT", getLocalPlayer(),
	function(tipo)
		dgsSetEnabled(dx.button[4], true)
		dgsSetEnabled(dx.button[5], true)
		dgsSetEnabled(dx.button[6], true)
		dgsSetText(dx.button[6], "Eliminar tarjeta")
		if tipo == "Normal" then
			dgsSetEnabled(dx.radio[3], false)
		elseif tipo == "Gold" then
			dgsSetEnabled(dx.radio[4], false)
		elseif tipo == "Platinum" then
			dgsSetEnabled(dx.radio[5], false)
		end
	end
)

addEvent("[SZAdmin]:refTarDel", true)
addEventHandler("[SZAdmin]:refTarDel", getLocalPlayer(),
	function(checkT, checkD, checkL, checkN)
		dgsSetText(dx.label[25], "¿Tiene tarjeta?: "..checkT)
		dgsSetText(dx.label[26], "Tipo de tarjeta: "..checkL)
		dgsSetText(dx.label[27], "Numero: "..checkN)
		dgsSetText(dx.label[28], "Depositado: "..checkD)
	end
)

addEvent("[SZAdmin]:refreshTar", true)
addEventHandler("[SZAdmin]:refreshTar", getLocalPlayer(),
	function(checkT, checkD, checkLvl, checkN)
		dgsSetText(dx.label[25], "¿Tiene tarjeta?: "..checkT)
		dgsSetText(dx.label[26], "Tipo de tarjeta: "..checkLvl)
		dgsSetText(dx.label[27], "Numero: "..checkN)
		dgsSetText(dx.label[28], "Depositado: $"..checkD)
	end
)

addEvent("[SZAdmin]:refreshDep", true)
addEventHandler("[SZAdmin]:refreshDep", getLocalPlayer(), 
	function(new)
		dgsSetText(dx.label[28], "Depositado: $"..new)
	end
)

addEvent("[SZAdmin]:refreshLvl", true)
addEventHandler("[SZAdmin]:refreshLvl", getLocalPlayer(),
	function(new)
		dgsSetText(dx.label[26], "Tipo de tarjeta: "..new)
		dgsSetEnabled(dx.radio[3], true)
		dgsSetEnabled(dx.radio[4], true)
		dgsSetEnabled(dx.radio[5], true)
		if new == "Normal" then
			dgsSetEnabled(dx.radio[3], false)
		elseif new == "Gold" then
			dgsSetEnabled(dx.radio[4], false)
		elseif new == "Platinum" then
			dgsSetEnabled(dx.radio[5], false)
		end
	end
)

addEventHandler("onClientPlayerJoin", root,
	function()
		local row = dgsGridListAddRow(dx.gridlist[1])
		dgsGridListSetItemText(dx.gridlist[1], row, dx.gridlist.column[1], getPlayerName(source), false, false)
		dgsGridListSetItemData(dx.gridlist[1], row, dx.gridlist.column[1], source)
	end
)

addEventHandler("onClientPlayerQuit", root,
	function()
		for row = 0, dgsGridListGetRowCount(dx.gridlist[1]) do
			local data = dgsGridListGetItemData(dx.gridlist[1], row, dx.gridlist.column[1])
			if data == source then
				dgsGridListRemoveRow(dx.gridlist[1], row)
			end
		end
	end
)
