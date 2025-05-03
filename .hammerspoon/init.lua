hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.hotkey.bind({ "ctrl" }, "Escape", function()
	hs.application.launchOrFocus("Ghostty")
end)

require("modules.ios-tunnel")

hs.alert.defaultStyle.textSize = 18
hs.alert.defaultStyle.radius = 12
hs.alert.defaultStyle.strokeColor.alpha = 0.2

hs.alert.show("Config loaded")
