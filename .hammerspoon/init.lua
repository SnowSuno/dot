hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.hotkey.bind({ "ctrl" }, "Escape", function()
	hs.application.launchOrFocus("Ghostty")
end)

hs.alert.defaultStyle.textSize = 18
hs.alert.defaultStyle.radius = 12
hs.alert.defaultStyle.strokeColor.alpha = 0.2

require("modules.ios-tunnel")
require("modules.cloudflared")

hs.alert.show("Config loaded")
