createTeam("Desempleado", 255, 255, 255)
createTeam("Policia", 102, 204, 255)
createTeam("SWAT", 51, 153, 255)
createTeam("FBI", 0, 115, 230)
local staff = createTeam("Staff", 0, 0, 0)
setTimer(function()
	local r = math.random(100, 200)
	local g = math.random(100, 200)
	local b = math.random(100, 200) 
	local staffs = getPlayersInTeam(getTeamFromName("Staff"))
	setTeamColor(staff, r, g, b)
	for _, playerValue in ipairs (staffs) do
		setBlipColor(playerValue, r, g, b, 255)
		setPlayerNametagColor(playerValue, r, g, b)
	end
end, 1000, 0)

function _setTeam(thePlayer, team)
	local r, g, b = getTeamColor(team)
	setBlipColor(thePlayer, r, g, b, 255)
	setPlayerNametagColor(thePlayer, r, g, b)
end
