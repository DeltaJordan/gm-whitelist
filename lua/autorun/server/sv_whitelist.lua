hook.Add("CheckPassword", "ServerWhitelist", function(steamID64)
	local whitelistTable = util.JSONToTable(file.Read("whitelist.json") or "{}", false, true)
	if not whitelistTable[steamID64] then return false, "You must be whitelisted to join this server." end
end)