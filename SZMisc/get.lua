function _get(where, whatDo, thePlayer)
    if getElementType(thePlayer) == "player" then
        local user = getAccountName(getPlayerAccount(thePlayer))
        if where == "bank" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?", user)
            if check then
                if whatDo == "getSomePlayerBankInfo" then return user, getPlayerIP(thePlayer), getPlayerSerial(thePlayer), check.Depositado, getPlayerMoney(thePlayer)
                elseif whatDo == "getPlayerCard" then return true
                elseif whatDo == "getPlayerBankDep" then return check.Depositado
                elseif whatDo == "admin" then return check.Depositado, check.Tarjeta, check.Lvl
                end
            end
        elseif where == "veh" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM vehicles WHERE Usuario = ?", user)
            if check then
                if whatDo == "getVehicle" then return true 
                elseif whatDo == "getAllVehiclesFromPlayer" then return check.Vehicles
                end
            end

        elseif where == "user" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", user)
            if check then
                if whatDo == "getSomePlayerInfo" then return user, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer)
                elseif whatDo == "getDBPlayerInfo" then return check.Skin, check.Dinero, check.Armor, check.Vida, check.x, check.y, check.z, check.xr, check.yr, check.zr, check.Interior, check.Dimension, check.Team
                elseif whatDo == "getAllActualPlayerInfo" then 
                    local x, y, z = getElementPosition(thePlayer)
                    local xr, yr, zr = getElementRotation(thePlayer)
                    local team
                    if getPlayerTeam(thePlayer) then team = getTeamName(getPlayerTeam(thePlayer)) else team = "Desempleado" end
                    return getElementModel(thePlayer) or 26, getPlayerMoney(thePlayer), getPedArmor(thePlayer), getElementHealth(thePlayer), x, y, z, xr, yr, zr, getElementInterior(thePlayer), getElementDimension(thePlayer), team
                end
            else
                if whatDo == "getRegistration" then
                    local checkS = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Serial = ?", getPlayerSerial(thePlayer))
                    --if checkS then return true, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer), checkS, checkS.Usuario
                    return false, getPlayerName(thePlayer), getPlayerIP(thePlayer), getPlayerSerial(thePlayer), false, false
                    --end
                end
            end
        elseif where == "admin" then
            if whatDo == "load" then
                local vehName, vehHp, vehModel, vehOwner, checkBank, cardDep, cardNum, cardLvl, team

                local vehicle = getPedOccupiedVehicle(thePlayer)
                if vehicle then 
                    vehName = getVehicleName(vehicle)
                    vehHp = getElementHealth(vehicle).."%"
                    vehModel = getElementModel(vehicle)
                end

                checkBank = _get("bank", "getPlayerCard", thePlayer)
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

function _loginget(user) --SZLogin, server, 42
    local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", user)
    if check then return check.Usuario, check.IP, check.Serial, check.Password, check.Rank end
end

function _respawnget(source)
    local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", getAccountName(getPlayerAccount(source)))
    if check then return check.Skin, check.Team end
end