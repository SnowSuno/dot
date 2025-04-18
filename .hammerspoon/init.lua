hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

hs.hotkey.bind({ "ctrl" }, "Escape", function()
	hs.application.launchOrFocus("Ghostty")
end)

hs.alert.show("Config loaded")
