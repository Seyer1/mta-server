loadstring(exports.DxLib:dgsImportFunction())()

local sx, sy = guiGetScreenSize()
local resX, resY = 1920, 1080
local x, y = (sx/resX), (sy/resY)

dx = {
	window = {},
	label = {},
	button = {},
	radio = {},
	edit = {},
	tab = {}
}
---[Ventanas]---
dx.window[1] = dgsCreateWindow(x*750, y*450, x*390, y*148, "Conseguir tarjeta", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[1], false)
dgsWindowSetSizable(dx.window[1], false)
dgsSetVisible(dx.window[1], false)

dx.window[2] = dgsCreateWindow(x*785, y*450, x*341, y*138, "Confirmar tarjeta", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[2], false)
dgsWindowSetSizable(dx.window[2], false)
dgsSetVisible(dx.window[2], false)

dx.window[3] = dgsCreateWindow(x*720, y*450, x*418, y*164, "[ZSBank] - by Seyer", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[3], false)
dgsWindowSetSizable(dx.window[3], false)
dgsSetVisible(dx.window[3], false)

dx.window[4] = dgsCreateWindow(x*1138, y*450, x*284, y*289, "Extracción", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[4], false)
dgsWindowSetSizable(dx.window[4], false)
dgsSetVisible(dx.window[4], false)

dx.window[5] = dgsCreateWindow(x*436, y*450, x*284, y*289, "Depósito", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[5], false)
dgsWindowSetSizable(dx.window[5], false)
dgsSetVisible(dx.window[5], false)

---[Tab]---
dx.tab[1] = dgsCreateTabPanel(x*0, y*(-22), x*390, y*148.5, false, dx.window[1])-- x*20 => x*0 
dx.tab[2] = dgsCreateTabPanel(x*0, y*(-22), x*341, y*137.5, false, dx.window[2])-- x*20 => x*0 
dx.tab[3] = dgsCreateTabPanel(x*0, y*(-22), x*418, y*162.5, false, dx.window[3])-- x*20 => x*0 
dx.tab[4] = dgsCreateTabPanel(x*0, y*(-22), x*284, y*288.5, false, dx.window[4])-- x*20 => x*0 
dx.tab[5] = dgsCreateTabPanel(x*0, y*(-22), x*284, y*288.5, false, dx.window[5])-- x*20 => x*0 

---[Botones]---
dx.button[1] = dgsCreateButton(x*14, y*80, x*140, y*62, "Sí", false, dx.tab[1], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[2] = dgsCreateButton(x*235, y*80, x*140, y*62, "No", false, dx.tab[1], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[3] = dgsCreateButton(x*8, y*70, x*140, y*62, "Confirmar", false, dx.tab[2], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[4] = dgsCreateButton(x*192, y*70, x*140, y*62, "Cancelar", false, dx.tab[2], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[5] = dgsCreateButton(x*230, y*85, x*177, y*68, "Extraer", false, dx.tab[3], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[6] = dgsCreateButton(x*10, y*85, x*177, y*68, "Depositar", false, dx.tab[3], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[7] = dgsCreateButton(x*13, y*230, x*258, y*46, "Extraer", false, dx.tab[4], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))
dx.button[8] = dgsCreateButton(x*13, y*230, x*258, y*46, "Depositar", false, dx.tab[5], _, _, _, _, _, _, tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150), tocolor(53, 198, 39, 150))

---[Labels]---
dx.label[1] = dgsCreateLabel(x*14, y*30, x*370, y*30, "Actualmente no tenes tarjeta por lo que no podrás usar el banco, \n                                        ¿querés conseguirla?", false, dx.tab[1])
dx.label[2] = dgsCreateLabel(x*14, y*30, x*272, y*15, "                           ¿Estas seguro? Sale $50.000", false, dx.tab[2])
dx.label[3] = dgsCreateLabel(x*30, y*35, x*582, y*31, "                  El banco Credicoop te da la bienvenida, "..getPlayerName(localPlayer)..".\n                          Acá podrás extraer y depositar dinero.", false, dx.tab[3])
dx.label[4] = dgsCreateLabel(x*10, y*30, x*261, y*22, "Dinero depositado: $0", false, dx.tab[4])
dx.label[5] = dgsCreateLabel(x*74, y*65, x*143, y*17, "¿Cuánto querés extraer?", false, dx.tab[4])
dx.label[6] = dgsCreateLabel(x*10, y*30, x*261, y*22, "Dinero depositado: $0", false, dx.tab[5])
dx.label[7] = dgsCreateLabel(x*72, y*65, x*143, y*17, "¿Cuánto querés depositar?", false, dx.tab[5])
dx.label[8] = dgsCreateLabel(x*400, y*30, x*143, y*17, "X", false, dx.tab[3])
dx.label[9] = dgsCreateLabel(x*270, y*30, x*143, y*17, "X", false, dx.tab[4])
dx.label[10] = dgsCreateLabel(x*270, y*30, x*143, y*17, "X", false, dx.tab[5])
dx.label[11] = dgsCreateLabel(x*-17, y*30, x*143, y*17, " ", false, dx.tab[4])
dx.label[12] = dgsCreateLabel(x*685, y*30, x*143, y*17, " ", false, dx.tab[5])

---[Radios]---
dx.radio[1] = dgsCreateRadioButton(x*12, y*105, x*60, y*15, " 5.000", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[2] = dgsCreateRadioButton(x*113, y*105, x*60, y*15, " 10.000", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[3] = dgsCreateRadioButton(x*207, y*105, x*60, y*15, " 25.000", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[4] = dgsCreateRadioButton(x*12, y*135, x*60, y*15, " 50.000", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[5] = dgsCreateRadioButton(x*113, y*135, x*65, y*15, " 100.000", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[6] = dgsCreateRadioButton(x*207, y*135, x*64, y*15, " 250.000", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[7] = dgsCreateRadioButton(x*92, y*165, x*99, y*17, " Personalizado", false, dx.tab[4], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[8] = dgsCreateRadioButton(x*12, y*105, x*60, y*15, " 5.000", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[9] = dgsCreateRadioButton(x*113, y*105, x*60, y*15, " 10.000", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[10] = dgsCreateRadioButton(x*207, y*105, x*60, y*15, " 25.000", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[11] = dgsCreateRadioButton(x*12, y*135, x*60, y*15, " 50.000", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[12] = dgsCreateRadioButton(x*113, y*135, x*65, y*15, " 100.000", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[13] = dgsCreateRadioButton(x*207, y*135, x*64, y*15, " 250.000", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)
dx.radio[14] = dgsCreateRadioButton(x*92, y*165, x*99, y*17, " Personalizado", false, dx.tab[5], tocolor(53, 198, 39, 150), _, _, _, _)

---[Edits]---
dx.edit[1] = dgsCreateEdit(x*13, y*190, x*258, y*30, "", false, dx.tab[4])
dx.edit[2] = dgsCreateEdit(x*13, y*190, x*258, y*30, "", false, dx.tab[5])

--------------------------------------------------------------------------------------   Principal   --------------------------------------------------------------------------------------
addEventHandler("onDgsMouseClick", dgsRoot,
	function(_, state)
		if state == "down" then
			cursor(source)
			windows(source)
			go(source)
		end
	end
)

addEvent("[SZBank]:actualizar", true)
addEventHandler("[SZBank]:actualizar", getLocalPlayer(),
	function(dep)
		dgsSetText(dx.label[4], "Dinero depositado: $"..dep)
		dgsSetText(dx.label[6], "Dinero depositado: $"..dep)
	end
)

addEvent("[SZBank]:conseguir", true)
addEventHandler("[SZBank]:conseguir", getLocalPlayer(),
	function()
		dgsSetVisible(dx.window[1], true)
		showCursor(true)
	end	
)

addEvent("[SZBank]:abrir", true)
addEventHandler("[SZBank]:abrir", getLocalPlayer(),
	function()
		dgsSetVisible(dx.window[3], true)
		showCursor(true)
	end
)

function cursor(source)
	if 	(source == dx.button[2]) or (source == dx.button[3]) or (source == dx.button[4]) or (source == dx.label[8]) or 
		(source == dx.label[11]) or (source == dx.label[12]) then showCursor(false)
	elseif (source == dx.button[1]) then showCursor(true)
	end
end

function windows(source)
	if (source == dx.button[1]) then dgsSetVisible(dx.window[2], true)
	elseif (source == dx.button[5]) then 
		if not dgsGetVisible(dx.window[4]) then dgsSetVisible(dx.window[4], true) reset("dep") 
		else dgsSetVisible(dx.window[4], false) 
		end
	elseif (source == dx.button[6]) then 
		if not dgsGetVisible(dx.window[5]) then dgsSetVisible(dx.window[5], true) reset("ext") 
		else dgsSetVisible(dx.window[5], false) 
		end
	end
	
	if (source == dx.button[1]) or (source == dx.button[2]) then dgsSetVisible(dx.window[1], false)
	elseif (source == dx.button[4]) or (source == dx.button[3]) then dgsSetVisible(dx.window[2], false)
	elseif (source == dx.label[8]) or (source == dx.label[11]) or (source == dx.label[12]) then 
		dgsSetVisible(dx.window[3], false)
		dgsSetVisible(dx.window[4], false)
		dgsSetVisible(dx.window[5], false)
	elseif (source == dx.label[9]) then dgsSetVisible(dx.window[4], false) 
	elseif (source == dx.label[10]) then dgsSetVisible(dx.window[5], false)
	end
end

function go(source)
	if (source == dx.button[3]) then triggerServerEvent("[SZBank]:confirm", getLocalPlayer(), getLocalPlayer()) end

	if (source == dx.button[8]) or (source == dx.button[7]) then
		if (source == dx.button[7]) then reset("dep") else reset("ext") end
		if dgsRadioButtonGetSelected(dx.radio[8]) or dgsRadioButtonGetSelected(dx.radio[1]) then cant = 5000
		elseif dgsRadioButtonGetSelected(dx.radio[9]) or dgsRadioButtonGetSelected(dx.radio[2]) then cant = 10000
		elseif dgsRadioButtonGetSelected(dx.radio[10]) or dgsRadioButtonGetSelected(dx.radio[3]) then cant = 25000
		elseif dgsRadioButtonGetSelected(dx.radio[11]) or dgsRadioButtonGetSelected(dx.radio[4]) then cant = 50000
		elseif dgsRadioButtonGetSelected(dx.radio[12]) or dgsRadioButtonGetSelected(dx.radio[5]) then cant = 100000
		elseif dgsRadioButtonGetSelected(dx.radio[13]) or dgsRadioButtonGetSelected(dx.radio[6]) then cant = 250000
		elseif dgsRadioButtonGetSelected(dx.radio[14]) and dgsGetText(dx.edit[2]) ~= "" then cant = tonumber(dgsGetText(dx.edit[2]))
		elseif dgsRadioButtonGetSelected(dx.radio[7]) and dgsGetText(dx.edit[1]) ~= "" then cant = tonumber(dgsGetText(dx.edit[1]))
		end

		if 	dgsRadioButtonGetSelected(dx.radio[1]) or dgsRadioButtonGetSelected(dx.radio[2]) or dgsRadioButtonGetSelected(dx.radio[3]) or
			dgsRadioButtonGetSelected(dx.radio[4]) or dgsRadioButtonGetSelected(dx.radio[5]) or dgsRadioButtonGetSelected(dx.radio[6]) or
			dgsRadioButtonGetSelected(dx.radio[7]) then
			triggerServerEvent("[SZBank]:depext", getLocalPlayer(), getLocalPlayer(), cant, "ext")
		else
			triggerServerEvent("[SZBank]:depext", getLocalPlayer(), getLocalPlayer(), cant, "dep")
		end
	end
end

function reset(modo)
	if modo == "ext" then
		dgsRadioButtonSetSelected(dx.radio[1], false)
		dgsRadioButtonSetSelected(dx.radio[2], false)
		dgsRadioButtonSetSelected(dx.radio[3], false)
		dgsRadioButtonSetSelected(dx.radio[4], false)
		dgsRadioButtonSetSelected(dx.radio[5], false)
		dgsRadioButtonSetSelected(dx.radio[6], false)
		dgsRadioButtonSetSelected(dx.radio[7], false)
		dgsSetText(dx.edit[1], "")
	else
		dgsRadioButtonSetSelected(dx.radio[8], false)
		dgsRadioButtonSetSelected(dx.radio[9], false)
		dgsRadioButtonSetSelected(dx.radio[10], false)
		dgsRadioButtonSetSelected(dx.radio[11], false)
		dgsRadioButtonSetSelected(dx.radio[12], false)
		dgsRadioButtonSetSelected(dx.radio[13], false)
		dgsRadioButtonSetSelected(dx.radio[14], false)
		dgsSetText(dx.edit[2], "")
	end
end