-----[Objetos]-----
local objeto = createObject ( 971, 2293.999023438, 2499.53, 5.4000005722046, 0, 0, 90 ) -- sfA/sfC
local objeto2 = createObject ( 10841, 2252.09, 2503.7501464844, 7.000191688538, 0, 0, 90 ) -- fA/fC
local objeto3 = createObject ( 10841, 2247.06484375, 2450.3828125, 17.8203125, 0, 0, 90 ) -- pA/pC
local objeto4 = createObject ( 971, 2334.740234375, 2443.9033203125, 6.1048053741455, 0, 0, 60 ) -- pC/sC/fC

-----[xyz]-----
local x,y,z = getElementPosition(objeto) -- sfA/sfC
local x2,y2,z2 = getElementPosition(objeto2) -- fA/fC
local x3,y3,z3 = getElementPosition(objeto3) -- fA/fC
local x4,y4,z4 = getElementPosition(objeto4) -- pC/sC/fC

-----[Zonas]-----
local Zona = createColCircle(x,y, 9, 5) -- sfA/sfC
local Zona2 = createColCircle(x2, y2, 5, 5) -- fA/fC
local Zona3 = createColCircle(2247.06484375, 2450.3828125, 15, 0) -- fA/fC
local Zona4 = createColCircle(x4,y4, 35, 5) -- pC/sC/fC

addEventHandler ( "onColShapeHit", root,
	function(thePlayer)
		if (getElementType(thePlayer) == "player") then
		local S = getTeamFromName("SWAT")
		local F = getTeamFromName("FBI")
		local P = getTeamFromName("Policia")
		local playerTeam = getPlayerTeam(thePlayer)
			if (source == Zona) then
				if (playerTeam == S) or (playerTeam == F) then
					moveObject(objeto, 1500, 2293.8999023438, 2510.03984375, 5.4000005722046, 0, 0, 0)
				elseif (playerTeam == nil) then
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser SWAT o FBI.", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser SWAT o FBI.", thePlayer, 255, 255, 255, true)
				end
			elseif (source == Zona2) then
				if (playerTeam == F) then
					moveObject(objeto2, 1500, 2252.09, 2510.7501464844, 7.000191688538, 0, 0, 0)
				elseif (playerTeam == nil) then
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser FBI.", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser FBI.", thePlayer, 255, 255, 255, true)
				end
			elseif (source == Zona3) then
				if (playerTeam == P) then
					moveObject(objeto3, 1500, 2247.06484375, 2450.3828125, 25, 0, 0, 0)
				elseif (playerTeam == nil) then
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser Policia.", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser Policia.", thePlayer, 255, 255, 255, true)
				end
			elseif (source == Zona4) then
				if (playerTeam == S) or (playerTeam == F) then
					moveObject (objeto4, 1500, 2334.740234375, 2443.9033203125, -3, 0, 0, 0)
				elseif (playerTeam == nil) then
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser SWAT o FBI.", thePlayer, 255, 255, 255, true)
				else
					outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser SWAT o FBI.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
)

addEventHandler ( "onColShapeLeave", root,
	function()
		if (source == Zona) then
			moveObject (objeto, 3000, 2293.8999023438, 2499.03984375, 5.4000005722046, 0, 0, 0)
		elseif (source == Zona2) then
			moveObject (objeto2, 3000, 2252.09, 2503.7501464844, 7.000191688538, 0, 0, 0)
		elseif (source == Zona3) then
			moveObject (objeto3, 3000, 2247.06484375, 2450.3828125, 17.8203125, 0, 0, 0)
		elseif (source == Zona4) then
			moveObject (objeto4, 3000, 2334.740234375, 2443.9033203125, 6.1048053741455, 0, 0, 0)
		end
	end
)