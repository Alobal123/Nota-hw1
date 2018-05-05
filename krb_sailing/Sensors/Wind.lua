local sensorInfo = {
	name = "Wind",
	desc = "Return sailing directions",
	author = "Krabec",
	date = "2018-04-26",
	license = "notAlicense",
}

local EVAL_PERIOD_DEFAULT = 0 -- acutal, no caching

function getInfo()
	return {
		period = EVAL_PERIOD_DEFAULT 
	}
end

-- speedups
local SpringGetWind = Spring.GetWind

-- @description return current wind statistics
return function()
	local dirX, dirY, dirZ, strength, normDirX, normDirY, normDirZ = SpringGetWind()
	return {
		dirX = dirX * strength*3,
		dirZ = dirZ * strength*3,
	}
end