loadstring(exports.DxLib:dgsImportFunction())()

local sx, sy = guiGetScreenSize()
local resX, resY = 1333, 768
local x, y = (sx/resX), (sy/resY)

local admin_panel = dgsCreateWindow(x*150, y*0, x*683, y*447, "[SZAdmin] - by #Dv^ + Seyer", false, _, _, _, _, _, _, _, true); 
dgsSetVisible(admin_panel, false)
centerWindow(admin_panel)

local admin_user_list = dgsCreateGridList(x*5, y*5, x*200, y*385, false, admin_panel)
local admin_users_list_show = dgsGridListAddColumn(admin_user_list, "Players", 0.948)
dgsGridListSetSortEnabled(admin_user_list, false)

local admin_main_tab = dgsCreateTabPanel(x*210, y*5, x*470, y*420, false, admin_panel)-- x*20 => x*0 

local admin_players_tab = dgsCreateTab(" Players ", admin_main_tab)
local admin_bank_tab = dgsCreateTab(" Bank ", admin_main_tab)
local admin_options_tab = dgsCreateTab(" Options ", admin_main_tab)

local admin_refresh = dgsCreateButton(x*5, y*394, x*200, y*30, "Refresh", false, admin_panel, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))

-- #Players
local admin_user_data = dgsCreateLabel(x*15, y*20, x*100, y*15, "Player:", false, admin_players_tab)
local admin_user_nick = dgsCreateLabel(x*25, y*45, x*100, y*15, "Nick: N/A", false, admin_players_tab)
local admin_user_acc = dgsCreateLabel(x*25, y*65, x*100, y*15, "Account: N/A", false, admin_players_tab)
local admin_user_ip = dgsCreateLabel(x*25, y*85, x*200, y*15, "IP: N/A", false, admin_players_tab)
local admin_user_serial = dgsCreateLabel(x*25, y*105, x*300, y*35, "Serial: N/A", false, admin_players_tab)
local admin_player_data = dgsCreateLabel(x*15, y*130, x*100, y*15, "Info:", false, admin_players_tab)
local admin_player_hp = dgsCreateLabel(x*25, y*155, x*100, y*15, "Health: N/A", false, admin_players_tab)
local admin_player_armor = dgsCreateLabel(x*25, y*175, x*100, y*15, "Armor: N/A", false, admin_players_tab)
local admin_player_money = dgsCreateLabel(x*25, y*195, x*100, y*15, "Money: N/A", false, admin_players_tab)
local admin_player_skin = dgsCreateLabel(x*25, y*215, x*100, y*15, "Skin ID: N/A", false, admin_players_tab)
local admin_player_team = dgsCreateLabel(x*25, y*235, x*100, y*15, "Team: N/A", false, admin_players_tab)
local admin_player_dim = dgsCreateLabel(x*25, y*255, x*100, y*15, "Dimension: N/A", false, admin_players_tab)
local admin_player_int = dgsCreateLabel(x*25, y*275, x*100, y*15, "Interior: N/A", false, admin_players_tab)
local admin_playerveh_data = dgsCreateLabel(x*15, y*300, x*100, y*15, "Vehicle:", false, admin_players_tab)
local admin_playerveh_is = dgsCreateLabel(x*25, y*325, x*100, y*15, "¿Esta en un vehículo?: N/A", false, admin_players_tab)
local admin_playerveh_hp = dgsCreateLabel(x*25, y*345, x*100, y*15, "Health: N/A", false, admin_players_tab)
local admin_playerveh_id = dgsCreateLabel(x*25, y*365, x*100, y*15, "ID: N/A", false, admin_players_tab)
local admin_playerveh_owner = dgsCreateLabel(x*25, y*385, x*100, y*15, "Owner: N/A", false, admin_players_tab)

local admin_goreconnect = dgsCreateButton(x*360, y*45, x*100, y*20, "Reconnect", false, admin_players_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dgsSetEnabled(admin_goreconnect, false)

local admin_goban = dgsCreateButton(x*360, y*70, x*100, y*20, "Ban", false, admin_players_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
dgsSetEnabled(admin_goban, false)

-- #Bank
local admin_bank_data = dgsCreateLabel(x*15, y*20, x*100, y*15, "Player:", false, admin_bank_tab)
local admin_bank_nick = dgsCreateLabel(x*25, y*45, x*100, y*15, "Nick: N/A", false, admin_bank_tab)
local admin_bank_acc = dgsCreateLabel(x*25, y*65, x*100, y*15, "Account: N/A", false, admin_bank_tab)
local admin_bank_ip = dgsCreateLabel(x*25, y*85, x*200, y*15, "IP: N/A", false, admin_bank_tab)
local admin_bank_serial = dgsCreateLabel(x*25, y*105, x*300, y*35, "Serial: N/A", false, admin_bank_tab)
local admin_playerBank_data = dgsCreateLabel(x*325, y*20, x*100, y*15, "Bank:", false, admin_bank_tab)
local admin_playerBank_has = dgsCreateLabel(x*335, y*45, x*300, y*35, "¿Tiene tarjeta?: N/A", false, admin_bank_tab)
local admin_playerBank_lvl = dgsCreateLabel(x*335, y*65, x*300, y*35, "Tipo de tarjeta: N/A", false, admin_bank_tab)
local admin_playerBank_num = dgsCreateLabel(x*335, y*85, x*300, y*35, "Número: N/A", false, admin_bank_tab)
local admin_playerBank_dep = dgsCreateLabel(x*335, y*105, x*300, y*35, "Depositado: N/A", false, admin_bank_tab)

local admin_playerBank_gochangedep = dgsCreateButton(x*70, y*170, x*100, y*20, "Modificar depósito", false, admin_bank_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
local admin_playerBank_gochangelvl = dgsCreateButton(x*185, y*170, x*100, y*20, "Modificar lvl", false, admin_bank_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
local admin_playerBank_gogiftremove = dgsCreateButton(x*300, y*170, x*100, y*20, "Regalar/Eliminar tarjeta", false, admin_bank_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
local admin_playerBank_changeDep = dgsCreateButton(x*185, y*350, x*100, y*20, "Actualizar", false, admin_bank_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
local admin_playerBank_changeLvl = dgsCreateButton(x*185, y*250, x*100, y*20, "Actualizar", false, admin_bank_tab, _, _, _, _, _, _, tocolor(251, 55, 0, 150), tocolor(251, 55, 0, 200), tocolor(251, 55, 0, 255))
local admin_bank_add = dgsCreateRadioButton(x*185, y*210, x*100, y*15, " Agregar a su depósito", false, admin_bank_tab, tocolor(251, 55, 0, 255), _, _, _, _)
local admin_bank_ext = dgsCreateRadioButton(x*185, y*280, x*100, y*15, " Quitarle a su depósito", false, admin_bank_tab, tocolor(251, 55, 0, 255), _, _, _, _)
local admin_bank_normal = dgsCreateRadioButton(x*70, y*210, x*100, y*15, " Actualizar a normal", false, admin_bank_tab, tocolor(251, 55, 0, 255), _, _, _, _)
local admin_bank_gold = dgsCreateRadioButton(x*190, y*210, x*100, y*15, " Actualizar a gold", false, admin_bank_tab, tocolor(251, 55, 0, 255), _, _, _, _)
local admin_bank_platinum = dgsCreateRadioButton(x*300, y*210, x*100, y*15, " Actualizar a platinum", false, admin_bank_tab, tocolor(251, 55, 0, 255), _, _, _, _)
local admin_bank_amountDep = dgsCreateEdit(x*135, y*240, x*200, y*20, "", false, admin_bank_tab)
local admin_bank_amountExt = dgsCreateEdit(x*135, y*310, x*200, y*20, "", false, admin_bank_tab)

bindKey("o", "down", function() 
	fancy() triggerServerEvent("[SZAdmin]:checkStaff", getLocalPlayer(), getLocalPlayer()) end)

addEventHandler("onDgsMouseClick", dgsRoot,
	function(_, state)
		local item = dgsGridListGetSelectedItem(admin_user_list)
		local staffName = getPlayerName(getLocalPlayer())
		if item and item ~= -1 then
			local data = dgsGridListGetItemData(admin_user_list, item, admin_users_list_show)
			if state == "down" then
				if source == admin_refresh then refresh()
				elseif source == admin_playerBank_gochangedep then changeVisibility("dep")
				elseif source == admin_playerBank_gochangelvl then changeVisibility("lvl")
				elseif source == admin_playerBank_gogiftremove then 
					changeVisibility("giftdel")
					triggerServerEvent("[SZAdmin]:bankAdmin", getLocalPlayer(), data, staffName, 0, "givedel", "")
				elseif source == admin_playerBank_changeDep then changeBankDep(data, staffName)
				elseif source == admin_playerBank_changeLvl then changeCardLvl(data, staffName)
				elseif source == admin_user_serial or source == admin_bank_serial then copySerial()
				elseif source == admin_user_list then go()
				end
			end
		else close()
		end	
	end
)

addEvent("[SZAdmin]:showInfo", true)
addEventHandler("[SZAdmin]:showInfo", getLocalPlayer(),
	function(u, nick, ip, serial, hp, armor, money, skin, team, int, dim, vehOwner, vehName, vehHp, vehModel, checkBank, cardDep, cardNum, cardLvl)
		---[Main]---
		dgsSetText(admin_user_nick, "Nick: "..nick)
		dgsSetText(admin_user_acc, "Account: "..u)
		dgsSetText(admin_user_ip, "IP: "..tostring(ip))
		dgsSetText(admin_user_serial, "Serial: "..serial)
		dgsSetText(admin_player_hp, "Health: "..hp)
		dgsSetText(admin_player_armor, "Armor: "..armor)
		dgsSetText(admin_player_money, "Money: "..money)
		dgsSetText(admin_player_skin, "Skin ID: "..skin)
		dgsSetText(admin_player_team, "Team: "..team)
		dgsSetText(admin_player_dim, "Dimension: "..dim)
		dgsSetText(admin_player_int, "Interior: "..int)
		dgsSetText(admin_playerveh_is, "¿Esta en un vehículo?: "..vehName)
		dgsSetText(admin_playerveh_hp, "Health: "..vehHp)
		dgsSetText(admin_playerveh_id, "ID: "..vehModel)
		dgsSetText(admin_playerveh_owner, "Owner: "..vehOwner)
		---[Bank]---
		dgsSetText(admin_bank_nick, "Nick: "..nick)
		dgsSetText(admin_bank_acc, "Account: "..u)
		dgsSetText(admin_bank_ip, "IP: "..tostring(ip))
		dgsSetText(admin_bank_serial, "Serial: "..serial)
		dgsSetText(admin_playerBank_has, "¿Tiene tarjeta?: "..checkBank)
		dgsSetText(admin_playerBank_lvl, "Tipo de tarjeta: "..cardLvl)
		dgsSetText(admin_playerBank_num, "Número: "..cardNum)
		dgsSetText(admin_playerBank_dep, "Depositado: $"..cardDep)
 
		activate(checkBank)
	end
)

addEvent("[SZAdmin]:abrir", true)
addEventHandler("[SZAdmin]:abrir", getLocalPlayer(),
	function()
		if not dgsGetVisible(admin_panel) then
			showCursor(true)
			dgsSetVisible(admin_panel, true)
			refresh()
		else
			showCursor(false)
			dgsSetVisible(admin_panel, false)
			dgsGridListClear(admin_user_list)
			close()
		end
	end
)


addEvent("[SZAdmin]:refreshTar", true)
addEventHandler("[SZAdmin]:refreshTar", getLocalPlayer(),
	function(checkT, checkD, checkLvl, checkN)
		dgsSetText(admin_playerBank_has, "¿Tiene tarjeta?: "..checkT)
		dgsSetText(admin_playerBank_lvl, "Tipo de tarjeta: "..checkLvl)
		dgsSetText(admin_playerBank_num, "Numero: "..checkN)
		dgsSetText(admin_playerBank_dep, "Depositado: "..checkD)
	end
)

addEvent("[SZAdmin]:refreshDep", true)
addEventHandler("[SZAdmin]:refreshDep", getLocalPlayer(), 
	function(new)
		dgsSetText(admin_playerBank_dep, "Depositado: "..new)
	end
)

addEvent("[SZAdmin]:refreshLvl", true)
addEventHandler("[SZAdmin]:refreshLvl", getLocalPlayer(),
	function(new)
		dgsSetText(admin_playerBank_lvl, "Tipo de tarjeta: "..new)
		dgsSetEnabled(admin_bank_normal, true)
		dgsSetEnabled(admin_bank_gold, true)
		dgsSetEnabled(admin_bank_platinum, true)
		if new == "Normal" then dgsSetEnabled(admin_bank_normal, false)
		elseif new == "Gold" then dgsSetEnabled(admin_bank_gold, false)
		elseif new == "Platinum" then dgsSetEnabled(admin_bank_platinum, false)
		end
	end
)

addEventHandler("onClientPlayerJoin", root,
	function()
		local row = dgsGridListAddRow(admin_user_list)
		dgsGridListSetItemText(admin_user_list, row, admin_users_list_show, getPlayerName(source), false, false)
		dgsGridListSetItemData(admin_user_list, row, admin_users_list_show, source)
	end
)

addEventHandler("onClientPlayerQuit", root,
	function()
		for row = 0, dgsGridListGetRowCount(admin_user_list) do
			local data = dgsGridListGetItemData(admin_user_list, row, admin_users_list_show)
			if data == source then dgsGridListRemoveRow(admin_user_list, row) end
		end
	end
)

function refresh() 
	dgsGridListClear(admin_user_list)
    for _, v in pairs(getElementsByType("player")) do
        local row = dgsGridListAddRow(admin_user_list)
        dgsGridListSetItemText(admin_user_list, row, admin_users_list_show, getPlayerName(v))
        dgsGridListSetItemData(admin_user_list, row, admin_users_list_show, v)
    end
end

function changeVisibility(whatDo)
	if whatDo == "dep" then
		dgsSetVisible(admin_bank_add, true)
		dgsSetVisible(admin_bank_ext, true)
		dgsSetVisible(admin_bank_amountDep, true)
		dgsSetVisible(admin_bank_amountExt, true)
		dgsSetVisible(admin_bank_normal, false)
		dgsSetVisible(admin_bank_gold, false)
		dgsSetVisible(admin_bank_platinum, false)
	elseif whatDo == "lvl" then
		dgsSetVisible(admin_bank_add, false)
		dgsSetVisible(admin_bank_ext, false)
		dgsSetVisible(admin_bank_amountDep, false)
		dgsSetVisible(admin_bank_amountExt, false)
		dgsSetVisible(admin_bank_normal, true)
		dgsSetVisible(admin_bank_gold, true)
		dgsSetVisible(admin_bank_platinum, true)
	elseif whatDo == "giftdel" then
		dgsSetVisible(admin_bank_add, false)
		dgsSetVisible(admin_bank_ext, false)
		dgsSetVisible(admin_bank_amountDep, false)
		dgsSetVisible(admin_bank_amountExt, false)
		dgsSetVisible(admin_bank_normal, false)
		dgsSetVisible(admin_bank_gold, false)
		dgsSetVisible(admin_bank_platinum, false)
	end
end

function activate(hasCard)
	dgsSetEnabled(admin_playerBank_gogiftremove, true)
	if hasCard == "No" then
		dgsSetEnabled(admin_playerBank_gochangedep, false)
		dgsSetEnabled(admin_playerBank_gochangelvl, false)
		dgsSetText(admin_playerBank_gogiftremove, "Regalar tarjeta")
	else
		dgsSetEnabled(admin_playerBank_gochangedep, true)
		dgsSetEnabled(admin_playerBank_gochangelvl, true)
		dgsSetText(admin_playerBank_gogiftremove, "Eliminar tarjeta")
	end
end
addEvent("[SZAdmin]:AdmininstrateCard", true)
addEventHandler("[SZAdmin]:AdmininstrateCard", getLocalPlayer(), activate)

function changeBankDep(data, staffName)
	local amount, whatDo
	if dgsRadioButtonGetSelected(admin_bank_add) or dgsRadioButtonGetSelected(admin_bank_ext) then
		if dgsRadioButtonGetSelected(admin_bank_add) then 
			amount = dgsGetText(admin_bank_amountDep)
			whatDo = "dep"
		else 
			amount = dgsGetText(admin_bank_amountExt) 
			whatDo = "ext"
		end
		if amount ~= "" then
			if tonumber(amount) then
				if tonumber(amount) >= 1 then triggerServerEvent("[SZAdmin]:bankAdmin", getLocalPlayer(), data, staffName, amount, whatDo, "")
				else exports.SZMisc:_msgcl("gral", "err", "cant")
				end
			else exports.SZMisc:_msgcl("gral", "err", "nro")
			end
		else exports.SZMisc:_msgcl("gral", "err", "some")
		end
	else exports.SZMisc:_msgcl("gral", "err", "func")
	end
end

function changeCardLvl(data, staffName)
	if dgsRadioButtonGetSelected(admin_bank_normal) or dgsRadioButtonGetSelected(admin_bank_gold) or dgsRadioButtonGetSelected(admin_bank_platinum) then
		local lvl
		if dgsRadioButtonGetSelected(admin_bank_normal) then lvl = "Normal" 
		elseif dgsRadioButtonGetSelected(admin_bank_gold) then lvl = "Gold"
		else lvl = "Platinum"
		end
		triggerServerEvent("[SZAdmin]:bankAdmin", getLocalPlayer(), data, staffName, 0, "changelvl", lvl)
	else exports.SZMisc:_msgcl("gral", "err", "func")
	end

end

function copySerial()
	local serial = dgsGetText(source):gsub("Serial: ", "")
	if serial ~= "N/A" then
		setClipboard(serial)
		print("Copied SERIAL!")
	end
end

function go()
	triggerServerEvent("[SZAdmin]:getInfo", getLocalPlayer(), getLocalPlayer(), data)
	dgsSetEnabled(admin_goreconnect, true)
	dgsSetEnabled(admin_goban, true)
end 

function close()
	dgsSetText(admin_user_nick, "Nick: N/A")
	dgsSetText(admin_user_acc, "Account: N/A")
	dgsSetText(admin_user_ip, "IP: N/A")
	dgsSetText(admin_user_serial, "Serial: N/A")
	dgsSetText(admin_player_hp, "Health: N/A")
	dgsSetText(admin_player_armor, "Armor: N/A")
	dgsSetText(admin_player_money, "Money: N/A")
	dgsSetText(admin_player_skin, "Skin ID: N/A")
	dgsSetText(admin_player_team, "Team: N/A")
	dgsSetText(admin_player_dim, "Dimension: N/A")
	dgsSetText(admin_player_int, "Interior: N/A")
	dgsSetText(admin_playerveh_is, "¿Esta en un vehículo?: N/A")
	dgsSetText(admin_playerveh_hp, "Health: N/A")
	dgsSetText(admin_playerveh_id, "ID: N/A")
	dgsSetText(admin_playerveh_owner, "Owner: N/A")
	dgsSetText(admin_bank_nick, "Nick: N/A")
	dgsSetText(admin_bank_acc, "Account: N/A")
	dgsSetText(admin_bank_ip, "IP: N/A")
	dgsSetText(admin_bank_serial, "Serial: N/A")
	dgsSetText(admin_playerBank_has, "¿Tiene tarjeta?: N/A")
	dgsSetText(admin_playerBank_lvl, "Tipo de tarjeta: N/A")
	dgsSetText(admin_playerBank_num, "Número: N/A")
	dgsSetText(admin_playerBank_dep, "Depositado: N/A")
	dgsSetText(admin_playerBank_gogiftremove, "Regalar/Eliminar tarjeta")
	dgsSetEnabled(admin_goreconnect, false)
	dgsSetEnabled(admin_goban, false)
	dgsSetEnabled(admin_playerBank_gochangedep, false)
	dgsSetEnabled(admin_playerBank_gochangelvl, false)
	dgsSetEnabled(admin_playerBank_gogiftremove, false)
	dgsSetVisible(admin_bank_add, false)
	dgsSetVisible(admin_bank_ext, false)
	dgsSetVisible(admin_bank_normal, false)
	dgsSetVisible(admin_bank_gold, false)
	dgsSetVisible(admin_bank_platinum, false)
	dgsSetVisible(admin_bank_amountDep, false)
	dgsSetVisible(admin_bank_amountExt, false)
	dgsSetVisible(admin_playerBank_changeDep, false)
	dgsSetVisible(admin_playerBank_changeLvl, false)
end

function fancy()
	if dgsGetFont(admin_user_acc) == "default" then
		local font = dxCreateFont("font/medium.ttf", 10)
		
		local elements = {
			[1] = admin_panel,
			[2] = admin_users_list,
			[3] = admin_main_tab,
			[4] = admin_players_tab,
			[5] = admin_refresh,
			[6] = admin_goreconnect,
			[7] = admin_goban,
			[8] = admin_user_data,
			[9] = admin_user_nick,
			[10] = admin_user_acc,
			[11] = admin_user_ip,
			[12] = admin_user_serial,
			[13] = admin_player_data,
			[14] = admin_player_hp,
			[15] = admin_player_armor,
			[16] = admin_player_money,
			[17] = admin_player_skin,
			[18] = admin_player_dim,
			[19] = admin_player_int,
			[20] = admin_player_team,
			[21] = admin_playerveh_data,
			[22] = admin_playerveh_is,
			[23] = admin_playerveh_hp,
			[24] = admin_playerveh_id,
			[25] = admin_playerveh_owner,
			[26] = admin_bank_tab,
			[27] = admin_playerBank_gochangedep,
			[28] = admin_playerBank_gochangelvl,
			[29] = admin_playerBank_gogiftremove,
			[30] = admin_playerBank_changeDep,
			[31] = admin_playerBank_changeLvl,
			[32] = admin_bank_add,
			[33] = admin_bank_ext,
			[34] = admin_bank_normal,
			[35] = admin_bank_gold,
			[36] = admin_bank_platinum,
			[37] = admin_bank_data,
			[38] = admin_bank_nick,
			[39] = admin_bank_acc,
			[40] = admin_bank_ip,
			[41] = admin_bank_serial,
			[42] = admin_playerBank_data,
			[43] = admin_playerBank_has,
			[44] = admin_playerBank_lvl,
			[45] = admin_playerBank_num,
			[46] = admin_playerBank_dep,
			[47] = admin_options_tab
		}
		for _, v in pairs(elements) do dgsSetFont(v, font) end

		local especial_labels = {
			[1] = admin_user_data,
			[2] = admin_player_data,
			[3] = admin_playerveh_data,
			[4] = admin_bank_data,
			[5] = admin_playerBank_data
		}
		for _, v in pairs(especial_labels) do dgsLabelSetColor(v, 255, 0, 0) end
	end
end