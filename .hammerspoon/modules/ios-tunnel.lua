local tunnelTask = nil

local shell = "/opt/homebrew/bin/fish"
local shellEnv = "SHELL=" .. shell .. " "

local function startTunnel()
	if tunnelTask and tunnelTask:isRunning() then
		return
	end

	hs.alert("연결중")

	tunnelTask = hs.task.new(shell, nil, { "-l", "-c", shellEnv .. "ENABLE_GO_IOS_AGENT=user sudo ios tunnel start" })

	if tunnelTask and tunnelTask:start() then
		hs.alert("iOS 연결됨")
		-- hs.notify.new({ title = "iOS 터널", informativeText = "시작됨" }):send()
	else
		hs.alert.show("iOS 연결 실패")
	end
end

-- 터널 중지 (케이블 뽑혔을 때)
local function stopTunnel()
	if tunnelTask and tunnelTask:isRunning() then
		tunnelTask:terminate()
		tunnelTask = nil
		hs.alert("iOS 연결 끊김")
		-- hs.notify.new({ title = "iOS 터널", informativeText = "종료됨" }):send()
	end
end

hs.usb.watcher
	.new(function(ev)
		if ev.productName and ev.productName:match("iPhone") then
			if ev.eventType == "added" then
				hs.timer.doAfter(1, startTunnel)
			end
			if ev.eventType == "removed" then
				stopTunnel()
			end
		end
	end)
	:start()

hs.hotkey.bind({ "cmd", "ctrl" }, "s", function()
	if tunnelTask and tunnelTask:isRunning() then
		hs.alert("Loading Screenshot")

		local filePath = os.getenv("HOME") .. "/screenshots/" .. os.date("%Y%m%d_%H%M%S") .. ".png"

		hs.task
			.new(shell, function(exitCode, _, stderr)
				if exitCode ~= 0 then
					hs.alert("❌ 스크린샷 실패: " .. (stderr or "unknown error"))
				end
			end, { "-l", "-c", shellEnv .. string.format("ios screenshot --output='%s'", filePath) })
			:start()
	end
end)
