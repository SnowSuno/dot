hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.hotkey.bind({ "ctrl" }, "Escape", function()
	hs.application.launchOrFocus("Ghostty")
end)

require("modules.ios-tunnel")

hs.alert.show("Config loaded")
