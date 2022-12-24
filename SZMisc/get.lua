function _get(where, whatDo, thePlayer)
    if getElementType(thePlayer) == "player" then
        local user = getAccountName(getPlayerAccount(thePlayer))
        if where == "bank" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?", user)
            if check then
                if whatDo == "all" then return user, getPlayerIP(thePlayer), getPlayerSerial(thePlayer), check.Depositado, getPlayerMoney(thePlayer)
                elseif whatDo == "check" then return true
                elseif whatDo == "refresh" then return check.Depositado
                elseif whatDo == "admin" then return check.Depositado, check.Tarjeta, check.Lvl
                end
            end
        elseif where == "veh" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM vehicles WHERE Usuario = ?", user)
            if check then
                if whatDo == "check" then return true 
                elseif whatDo == "getvehicles" then return check.Vehicles
                end
            end

        elseif where == "user" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", user)
            if check then
                if whatDo == "some" then return user, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer)
                elseif whatDo == "load" then return check.Skin, check.Dinero, check.Armor, check.Vida, check.x, check.y, check.z, check.xr, check.yr, check.zr, check.Interior, check.Dimension, check.Team
                elseif whatDo == "save" then 
                    local x, y, z = getElementPosition(thePlayer)
                    local xr, yr, zr = getElementRotation(thePlayer)
                    local team
                    if getPlayerTeam(thePlayer) then team = getTeamName(getPlayerTeam(thePlayer)) end
                    return getElementModel(thePlayer) or 0, getPlayerMoney(thePlayer), getPedArmor(thePlayer), getElementHealth(thePlayer), x, y, z, xr, yr, zr, getElementInterior(thePlayer), getElementDimension(thePlayer), team
                elseif whatDo == "firstSpawn" then return check.x, check.y, check.z, check.xr, check.yr, check.zr, check.Skin, check.Team, check.Dinero
                end
            else
                if whatDo == "reg" then
                    local checkS = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Serial = ?", getPlayerSerial(thePlayer))
                    if checkS then return true, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer), checkS, checkS.Usuario
                    else return false, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer), false, false
                    end
                elseif whatDo == "regspawn" then
                    local x, y, z, xr = 1674.18359375, 1447.8720703125, 10.783271789551, -90
                    local hp, armor, skin, reg = 100, 0, 26, 0
                    local team, rank = "Desempleado", "User"
                    local int, dim = 0, 0
                    return x, y, z, xr, skin, team, reg, hp, armor, rank, int, dim
                end
            end
        elseif where == "cmd" then
            if whatDo == "money" then return getPlayerMoney(thePlayer) end
        elseif where == "admin" then
            if whatDo == "load" then
                local vehName, vehHp, vehModel, vehOwner, checkBank, cardDep, cardNum, cardLvl, team

                local vehicle = getPedOccupiedVehicle(thePlayer)
                if vehicle then 
                    vehName = getVehicleName(vehicle)
                    vehHp = getElementHealth(vehicle).."%"
                    vehModel = getElementModel(vehicle)
                end

                checkBank = _get("bank", "check", thePlayer)
                if checkBank then 
                    cardDep, cardNum, cardLvl = _get("bank", "admin", thePlayer)
                    checkBank = "Sí" 
                end

                if getPlayerTeam(thePlayer) then team = getTeamName(getPlayerTeam(thePlayer)) end
                return user, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer), getElementHealth(thePlayer), getPedArmor(thePlayer), getPlayerMoney(thePlayer), getElementModel(thePlayer) or 0, team, getElementInterior(thePlayer), getElementDimension(thePlayer), vehOwner or "N/A", vehName or "No", vehHp or "N/A", vehModel or "N/A", checkBank or "No", cardDep or "N/A", cardNum or "N/A", cardLvl or "N/A"
            end
        end
        --[[local guns = { }
        for slot = 0, 12 do
            guns[slot] = 
            {
                gun = getPedWeapon (thePlayer, slot), 
                ammo = getPedTotalAmmo (thePlayer, slot) 
            }
        end]]
    end
end

function _loginget(u) --SZLogin, server, 42
    local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", u)
    if check then return check.Usuario, check.IP, check.Serial, check.Password, check.Rank end
end

function _respawnget(source)
    local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", getAccountName(getPlayerAccount(source)))
    if check then return check.Skin, check.Team end
end