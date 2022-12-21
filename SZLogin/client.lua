loadstring(exports.DxLib:dgsImportFunction())()

local sx, sy = guiGetScreenSize()
local resX, resY = 1920, 1080
local x, y = (sx/resX), (sy/resY)

dx = {
	window = {},
	tab = {},
	label = {},
	button = {},
	edit = {}
}

---[Windows]---
dx.window[1] = dgsCreateWindow(x*800, y*400, x*323, y*284, "[SZLogin] - by Seyer", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[1], false)
dgsWindowSetSizable(dx.window[1], false)
dgsSetVisible(dx.window[1], false)

dx.window[2] = dgsCreateWindow(x*800, y*400, x*326, y*340, "[SZRegister] - by Seyer", false, _, _, _, _, _, _, _, true)
dgsWindowSetMovable(dx.window[2], false)
dgsWindowSetSizable(dx.window[2], false)
dgsSetVisible(dx.window[2], false)

---[Tabs]---
dx.tab[1] = dgsCreateTabPanel(x*0, y*(-22), x*323, y*283.5, false, dx.window[1])-- x*20 => x*0 
dx.tab[2] = dgsCreateTabPanel(x*0, y*(-22), x*326, y*339.5, false, dx.window[2])-- x*20 => x*0 

---[Labels]---
dx.label[1] = dgsCreateLabel(x*33, y*38, x*48, y*15, "Usuario:", false, dx.tab[1])
dx.label[2] = dgsCreateLabel(x*257, y*63, x*56, y*15, "(máx. 25)", false, dx.tab[1])
dx.label[3] = dgsCreateLabel(x*10, y*102, x*71, y*16, "Contraseña:", false, dx.tab[1])
dx.label[4] = dgsCreateLabel(x*257, y*128, x*56, y*15, "(máx. 25)", false, dx.tab[1])
dx.label[5] = dgsCreateLabel(x*33, y*38, x*48, y*15, "Usuario:", false, dx.tab[2])
dx.label[6] = dgsCreateLabel(x*257, y*63, x*56, y*15, "(máx. 25)", false, dx.tab[2])
dx.label[7] = dgsCreateLabel(x*10, y*102, x*71, y*16, "Contraseña:", false, dx.tab[2])
dx.label[8] = dgsCreateLabel(x*257, y*128, x*56, y*15, "(máx. 25)", false, dx.tab[2])
dx.label[9] = dgsCreateLabel(x*25, y*157, x*45, y*13, "Repetir", false, dx.tab[2])
dx.label[10] = dgsCreateLabel(x*10, y*170, x*71, y*16, "contraseña:", false, dx.tab[2])
dx.label[11] = dgsCreateLabel(x*257, y*186, x*56, y*15, "(máx. 25)", false, dx.tab[2])

---[Buttons]---
dx.button[1] = dgsCreateButton(x*9, y*163, x*304, y*48, "Login", false, dx.tab[1], _, _, _, _, _, _, tocolor(66, 134, 244, 150), tocolor(10, 250, 244, 150), tocolor(130, 200, 244, 150))
dx.button[2] = dgsCreateButton(x*9, y*226, x*304, y*48, "Register", false, dx.tab[1], _, _, _, _, _, _, tocolor(66, 134, 244, 150), tocolor(66, 134, 244, 150), tocolor(66, 134, 244, 150))
dx.button[3] = dgsCreateButton(x*9, y*224, x*304, y*48, "Register", false, dx.tab[2], _, _, _, _, _, _, tocolor(66, 134, 244, 150), tocolor(66, 134, 244, 150), tocolor(66, 134, 244, 150))
dx.button[4] = dgsCreateButton(x*9, y*283, x*304, y*48, "Login", false, dx.tab[2], _, _, _, _, _, _, tocolor(66, 134, 244, 150), tocolor(66, 134, 244, 150), tocolor(66, 134, 244, 150))

---[Edits]---
dx.edit[1] = dgsCreateEdit(x*87, y*30, x*226, y*33, "", false, dx.tab[1])
dgsEditSetMaxLength(dx.edit[1], 25)

dx.edit[2] = dgsCreateEdit(x*87, y*95, x*226, y*33, "", false, dx.tab[1])
dgsEditSetMaxLength(dx.edit[2], 25)
dgsEditSetMasked(dx.edit[2], true)

dx.edit[3] = dgsCreateEdit(x*87, y*30, x*226, y*33, "", false, dx.tab[2])
dgsEditSetMaxLength(dx.edit[3], 25)

dx.edit[4] = dgsCreateEdit(x*87, y*95, x*226, y*33, "", false, dx.tab[2])
dgsEditSetMaxLength(dx.edit[4], 25)
dgsEditSetMasked(dx.edit[4], true)

dx.edit[5] = dgsCreateEdit(x*87, y*153, x*226, y*33, "", false, dx.tab[2])
dgsEditSetMaxLength(dx.edit[5], 25)
dgsEditSetMasked(dx.edit[5], true)
-------------------------------------------------------------------------------Funciones-------------------------------------------------------------------------------
addEventHandler("onDgsMouseClick", dgsRoot,
	function(_, state)
		if state == "down" then
			if (source == dx.button[2]) then changeVisibilityLogin("reg")
			elseif (source == dx.button[4]) then changeVisibilityLogin("login")
			else
				local u, pw, pw2 = get(source)
				if isOK(u, pw, pw2) then
					if (source == dx.button[1]) then triggerServerEvent("[SZLogin]:login", getLocalPlayer(), getLocalPlayer(), u, pw)
					else triggerServerEvent("[SZLogin]:register", getLocalPlayer(), getLocalPlayer(), u, pw)
					end
				end
			end
		end
	end
)

addEvent("[SZLogin]:abrir", true)
addEventHandler("[SZLogin]:abrir", getLocalPlayer(),
	function()
		dgsSetVisible(dx.window[1], true)
		showCursor(true)
	end
)

addEvent("[SZLogin]:cerrar", true)
addEventHandler("[SZLogin]:cerrar", getLocalPlayer(),
	function()
		dgsSetVisible(dx.window[1], false)
		dgsSetVisible(dx.window[2], false)
		showCursor(false)
	end
)

function get(source)
	local u, pw, pw2
	if (source == dx.button[1]) then
		u = dgsGetText(dx.edit[1])
		pw = dgsGetText(dx.edit[2])
	elseif (source == dx.button[3]) then
		u = dgsGetText(dx.edit[3])
		pw = dgsGetText(dx.edit[4])
		pw2 = dgsGetText(dx.edit[5])
	end
	return u, pw, pw2 or pw
end

function changeVisibilityLogin(modo)
	if modo == "login" then
		dgsSetVisible(dx.window[2], false)
		dgsSetVisible(dx.window[1], true)
	else
		dgsSetVisible(dx.window[1], false)
		dgsSetVisible(dx.window[2], true)
	end
end

function isOK(user, pw, pw2)
	if u == "" or pw == "" or pw2 == "" then exports.SZMisc:_msgcl("gral", "err", "all")
	elseif pw ~= pw2 then exports.SZMisc:_msgcl("login", "err", "dist")
	elseif (#u < 5) then exports.SZMisc:_msgcl("login", "err", "uDig")
	elseif (#pw < 6) then exports.SZMisc:_msgcl("login", "err", "pwDig")
	else return true 
	end
end