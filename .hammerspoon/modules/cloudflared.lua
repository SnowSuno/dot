local env = require("env")

local menu = hs.menubar.new(true, "hs:cloudflared")
local task = nil
local isRunning = false

local function updateMenuTitle()
	if isRunning then
		menu:setTitle("■") -- 실행 중
	else
		menu:setTitle("▶") -- 멈춤 상태
	end
end

local icon = hs.image.imageFromURL("https://icon.icepanel.io/Technology/svg/Cloudflare.svg")

local function startCommand()
	task = hs.task.new(
		"/opt/homebrew/bin/fish",
		nil,
		{ "-c", "cloudflared access tcp --hostname " .. env.PROXY_HOST .. " --url localhost:3128" }
	)

	hs.notify
		.new({
			title = "Cloudflared",
			informativeText = "터널 시작됨",
			contentImage = icon,
		})
		:send()

	task:setCallback(function(exitCode, stdOut, stdErr)
		isRunning = false
		hs.notify.show({
			title = "Cloudflared",
			informativeText = "에러 발생: " .. tostring(exitCode),
			contentImage = icon,
		})
		updateMenuTitle()
	end)

	task:start()
	isRunning = true
	updateMenuTitle()
end

local function stopCommand()
	if task then
		task:terminate()
		task = nil
	end

	hs.notify
		.new({
			title = "Cloudflared",
			informativeText = "터널 종료됨",
			contentImage = icon,
		})
		:send()

	isRunning = false
	updateMenuTitle()
end

local function toggle()
	if isRunning then
		stopCommand()
	else
		startCommand()
	end
end

hs.network.reachability
	.internet()
	:setCallback(function(self, flags)
		if (flags & hs.network.reachability.flags.reachable) <= 0 then
			stopCommand()
		end
	end)
	:start()

if menu then
	updateMenuTitle()
	menu:setClickCallback(toggle)
end
