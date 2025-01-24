local CATEGORY_NAME = "Utility"
local function addToWhitelist(calling_ply, steamID64)
	local whitelistTable = util.JSONToTable(file.Read("whitelist.json") or "{}", false, true)
	whitelistTable[steamID64] = true
	file.Write("whitelist.json", util.TableToJSON(whitelistTable, true))
	ULib.tsay(calling_ply, "Updated the whitelist to include" .. steamID64 .. ".")
end

local whitelistcmd = ulx.command(CATEGORY_NAME, "ulx whitelist", addToWhitelist, "!whitelist")
whitelistcmd:addParam{
	type = ULib.cmds.StringArg,
	usage = "The player's SteamID64"
}

whitelistcmd:defaultAccess(ULib.ACCESS_ADMIN)
whitelistcmd:help("Updates the server's whitelist.")