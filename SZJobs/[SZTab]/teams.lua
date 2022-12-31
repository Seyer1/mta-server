--Main events
addEventHandler("onResourceStart", getRootElement(),
	function()
		createTeams()
		setPlayersOnTeam()
		setTimer(rainbowStaff, 1000, 0)
	end
)

--Main functions
function createTeams()
	createTeam("Desempleado", 255, 255, 255)
	createTeam("Policia", 102, 204, 255)
	createTeam("SWAT", 51, 153, 255)
	createTeam("FBI", 0, 115, 230)
	createTeam("Staff", 0, 0, 0)
end

function setPlayersOnTeam()
	local players = getElementsByType("player")
	for _, player in ipairs(players) do
		local _, team = exports.SZMisc:_respawnget(player)
		setPlayerTeam(player, getTeamFromName(team))
	end
end

function rainbowStaff()
	local r, g, b = math.random(100, 200), math.random(100, 200), math.random(100, 200)
	local staffs = getPlayersInTeam(getTeamFromName("Staff"))
	setTeamColor(getTeamFromName("Staff"), r, g, b)
	for _, playerValue in ipairs (staffs) do
		setBlipColor(playerValue, r, g, b, 255)
		setPlayerNametagColor(playerValue, r, g, b)
	end
end