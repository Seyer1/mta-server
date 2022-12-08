function _get(origen, modo, thePlayer)
    if getElementType(thePlayer) == "player" then
        local u = getAccountName(getPlayerAccount(thePlayer))
        local ip = getPlayerIP(thePlayer)
        local serial = getPlayerSerial(thePlayer)
        local money = getPlayerMoney(thePlayer)
        local nick = getPlayerName(thePlayer)
        local skin = getElementModel(thePlayer)
        local int = getElementInterior(thePlayer)
        local dim = getElementDimension(thePlayer)
        local hp = getElementHealth(thePlayer)
        local armor = getPedArmor(thePlayer)
        local x, y, z = getElementPosition(thePlayer)
        local xr, yr, zr = getElementRotation(thePlayer)
        local team =  getTeamName(getPlayerTeam(thePlayer))
        local guns = { }
        for slot = 0, 12 do
            guns[slot] = 
            {
                gun = getPedWeapon (thePlayer, slot), 
                ammo = getPedTotalAmmo (thePlayer, slot) 
            }
        end

        if origen == "bank" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM bank WHERE Usuario = ?", u)
            if check then
                if modo == "todo" then return u, ip, serial, check.Depositado, money
                elseif modo == "check" then return true
                elseif modo == "act" then return check.Depositado
                end
            end

        elseif origen == "user" then
            local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", u)
            if check then
                if modo == "some" then return u, ip, serial
                elseif modo == "load" then return check.Skin, check.Dinero, check.Armor, check.Vida, check.x, check.y, check.z, check.xr, check.yr, check.zr, check.Interior, check.Dimension, check.Team--, getTeamFromName(check.Team), fromJSON(check.Weapons)
                elseif modo == "save" then return skin, money, armor, hp, x, y, z, xr, yr, zr, int, dim, team
                elseif modo == "firstSpawn" then return check.x, check.y, check.z, check.xr, check.yr, check.zr, check.Skin, check.Team, check.Dinero
                end
            else
                if modo == "reg" then
                    local checkS = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Serial = ?", serial)
                    if checkS then return true, nick, ip, serial, checkS, checkS.Usuario
                    else return false, nick, ip, serial, false, false
                    end
                elseif modo == "regspawn" then
                    local x, y, z, xr = 1674.18359375, 1447.8720703125, 10.783271789551, -90
                    local hp, armor, skin, reg = 100, 0, 26, 0
                    local team, rank = "Desempleado", "User"
                    local int, dim = 0, 0
                    return x, y, z, xr, skin, team, reg, hp, armor, rank, int, dim
                end
            end
        elseif origen == "cmd" then
            if modo == "money" then return money end
        end
    end
end

function _loginget(u)
    local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", u)
    if check then return check.Usuario, check.IP, check.Serial, check.Password, check.Rank end
end

function _respawnget(source)
    local u = getAccountName(getPlayerAccount(source))
    local check = exports.SZSQL:_QuerySingle("SELECT * FROM users WHERE Usuario = ?", u)
    if check then return check.Skin, check.Team end
end