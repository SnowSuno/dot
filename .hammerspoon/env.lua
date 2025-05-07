local M = {}

local function trim(s)
	return s:match("^%s*(.-)%s*$")
end

local function loadEnvFile(path)
	local env = {}
	local file = io.open(path, "r")
	if not file then
		return env
	end

	for line in file:lines() do
		if not line:match("^#") and line:match("=") then
			local key, value = line:match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
			if key and value then
				value = value:gsub('^"(.*)"$', "%1")
				value = value:gsub("^'(.*)'$", "%1")
				env[key] = trim(value)
			end
		end
	end

	file:close()
	return env
end

-- 자동 로드
local envPath = os.getenv("HOME") .. "/.hammerspoon/.env"
M.vars = loadEnvFile(envPath)

setmetatable(M, {
	__index = function(_, k)
		return M.vars[k]
	end,
})

return M
