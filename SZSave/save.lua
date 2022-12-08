addEventHandler("onPlayerQuit", getRootElement(),
	function()
		if not isGuestAccount(getPlayerAccount(source)) then
			local u = getAccountName(getPlayerAccount(source))
			local skin, dinero, armor, vida, x, y, z, xr, yr, zr, int, dim, team = exports.SZMisc:_get("user", "save", source)
			exports.SZSQL:_Exec("UPDATE users SET Skin = ?, Dinero = ?, Armor = ?, Vida = ?, x = ?, y = ?, z = ?, xr = ?, yr = ?, zr = ?, Interior = ?, Dimension = ?, Team = ? WHERE Usuario = ?", skin, dinero, armor, vida, x, y, z, xr, yr, zr, int, dim, team, u)
		end
	end
)

addEventHandler("onResourceStop", getRootElement(),
	function()
		for _,v in ipairs(getElementsByType("player")) do
			if not isGuestAccount(getPlayerAccount(v)) then
				local u = getAccountName(getPlayerAccount(v))
				local skin, dinero, armor, vida, x, y, z, xr, yr, zr, int, dim, team = exports.SZMisc:_get("user", "save", v)
				exports.SZSQL:_Exec("UPDATE users SET Skin = ?, Dinero = ?, Armor = ?, Vida = ?, x = ?, y = ?, z = ?, xr = ?, yr = ?, zr = ?, Interior = ?, Dimension = ?, Team = ? WHERE Usuario = ?", skin, dinero, armor, vida, x, y, z, xr, yr, zr, int, dim, team, u)	
			end
		end
	end
)

addEventHandler("onPlayerLogin", getRootElement(),
	function()
		if not isGuestAccount(getPlayerAccount(source)) then 
			local checkS, checkD, checkA, checkV, checkX, checkY, checkZ, checkXr, checkYr, checkZr, checkInt, checkDim, checkTeam = exports.SZMisc:_get("user", "load", source)
			setElementModel(source, checkS)
			setPlayerMoney(source, checkD)
			setPedArmor(source, checkA)
			setElementHealth(source, checkV)
			setElementPosition(source, checkX, checkY, checkZ)
			setElementRotation(source, checkXr, checkYr, checkZr)
			setElementInterior(source, checkInt)
			setElementDimension(source, checkDim)
			setPlayerTeam(source, getTeamFromName(checkTeam))
			exports.SZJobs:_setTeam(source, checkTeam)
			--if (type(checkW) == "table") then 
			--	for _, weapon in pairs (checkW) do 
			--		if (weapon.gun and weapon.ammo) then 
			--			giveWeapon(source, weapon.gun, weapon.ammo)
			--		end 
			--	end
			--end
		end
	end
)

addEventHandler("onPlayerSpawn",getRootElement(),
	function()
		if not isGuestAccount(getPlayerAccount(source)) then 
			local skin, team = exports.SZMisc:_respawnget(source)
			setElementModel(source, skin)
			setPlayerTeam(source, team)
		end
	end
)
