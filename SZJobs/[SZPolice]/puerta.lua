-----[Objetos]-----
local object = {
	[1] = createObject(971, 2293.999023438, 2499.53, 5.4000005722046, 0, 0, 90),
	[2] = createObject(971, 2334.740234375, 2443.9033203125, 6.1048053741455, 0, 0, 60),
	[3] = createObject(10841, 2247.06484375, 2450.3828125, 17.8203125, 0, 0, 90),
	[4] = createObject(10841, 2252.09, 2503.7501464844, 7.000191688538, 0, 0, 90)
}

-----[Zonas]-----
local garageBasementJoin = createColCircle(2293.999023438, 2499.53, 9, 5)
local garageBasementLeft = createColCircle(2334.740234375, 2443.9033203125, 35, 5)
local garageJoin = createColCircle(2247.06484375, 2450.3828125, 15, 0) -- fA/fC
local Zona2 = createColCircle(2252.09, 2503.7501464844, 5, 5) -- fA/fC

addEventHandler("onColShapeHit", root,
	function(thePlayer)
		if (getElementType(thePlayer) == "player") then
		local SWAT, FBI, Police, Staff = getTeamFromName("SWAT"), getTeamFromName("FBI"), getTeamFromName("Policia"), getTeamFromName("Staff")
		local playerTeam = getPlayerTeam(thePlayer)
			if (source == garageBasementJoin) or (source == garageBasementLeft) then
				if (playerTeam == SWAT) or (playerTeam == FBI) or (playerTeam == Staff) then
					if (source == garageBasementJoin) then print("1") moveObject(object[1], 1500, 2293.8999023438, 2510.03984375, 5.4000005722046, 0, 0, 0)
					elseif (source == garageBasementLeft) then print("4") moveObject (object[4], 1500, 2334.740234375, 2443.9033203125, -3, 0, 0, 0)
					end
				else outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser SWAT o FBI.", thePlayer, 255, 255, 255, true)
				end
			elseif (source == Zona2) then
				if (playerTeam == FBI) or (playerTeam == Staff) then print("2") moveObject(object[2], 1500, 2252.09, 2510.7501464844, 7.000191688538, 0, 0, 0)
				else outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser FBI.", thePlayer, 255, 255, 255, true)
				end
			elseif (source == garageJoin) then
				if (playerTeam == Police) or (playerTeam == Staff) then print("3") moveObject(object[3], 1500, 2247.06484375, 2450.3828125, 25, 0, 0, 0)
				else outputChatBox("#DD0606[Error]#FFFFFF No podes entrar! Tenes que ser Policia.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
)

addEventHandler("onColShapeLeave", root,
	function()
		if (source == garageBasementJoin) then moveObject (object[1], 1000, 2293.999023438, 2499.53, 5.4000005722046, 0, 0, 90)
		elseif (source == garageBasementLeft) then moveObject (object[4], 3000, 2247.06484375, 2450.3828125, 17.8203125, 0, 0, 0)
		elseif (source == garageJoin) then moveObject (object[3], 3000, 2334.740234375, 2443.9033203125, 6.1048053741455, 0, 0, 0)
		elseif (source == Zona2) then moveObject (object[2], 3000, 2252.09, 2503.7501464844, 7.000191688538, 0, 0, 0)
		end
	end
)