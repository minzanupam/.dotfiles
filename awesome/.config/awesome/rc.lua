-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")


local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
-- battery indicator widget
local batteryarc_widget = require("awesome-wm-widgets.batteryarc-widget.batteryarc")
-- powerline
-- package.path = package.path .. ';/usr/lib/python3.8/site-packages/powerline/bindings/awesome/powerline.lua'
-- require('powerline')

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

-- my theme
beautiful.init("/home/anupam/.config/awesome/themes/default.lua")
-- my wallpaper
-- beautiful.get().wallpaper =
-- 	"/home/anupam/Pictures/wallpapers/minimal/255909-vertical-minimalistic-wallpaper-3840x2160-images.jpg"

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {

	awful.layout.suit.tile,
	awful.layout.suit.max,
	-- awful.layout.suit.spiral.dwindle,
	-- awful.layout.suit.tile.bottom,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.magnifier,
	-- awful.layout.suit.max.fullscreen,
	-- awful.layout.suit.fair,
	-- awful.layout.suit.tile.left,
	-- awful.layout.suit.fair.horizontal,
	-- awful.layout.suit.spiral,
	-- awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
	-- awful.layout.suit.floating,
	-- awful.layout.suit.tile.top,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual",      terminal .. " -e man awesome" },
	{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart",     awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

mymainmenu = awful.menu({
	items = { { "awesome", myawesomemenu, beautiful.awesome_icon }, { "open terminal", terminal } },
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }, s, awful.layout.layouts[1])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = tasklist_buttons,
	})

	-- Create the wibox
	-- s.mywibox = awful.wibar({ position = "top", screen = s })
	s.mywibox = awful.wibar({ position = "top", height = 30, screen = s, })
	-- awful.placement.top(s.mywibox, {
	-- 	margins = {
	-- 		top = dpi(2),
	-- 	}
	-- })

	-- wibox visiblity
	s.mywibox.visible = true

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{
			-- Left widgets
			layout = wibox.layout.fixed.horizontal,
			mylauncher,
			s.mytaglist,
			s.mypromptbox,
		},
		s.mytasklist, -- Middle widget
		{
			-- Right widgets
			layout = wibox.layout.fixed.horizontal,
			mykeyboardlayout,
			wibox.widget.systray(),
			mytextclock,
			batteryarc_widget(),
			s.mylayoutbox,
			-- powerline_widget,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	--my keybindings
	awful.key({ "Mod4", "Shift" }, "p", function()
		awful.spawn("/home/anupam/scripts/change_window_name.sh")
	end),

	awful.key({ "Mod4" }, "p", function()
		awful.spawn("/home/anupam/scripts/screenshot.sh")
		-- awful.spawn("rofi -modi 'clipboard:greenclip print' -show clipboard ")
		--  awful.spawn("clipmenu")
	end),

	awful.key({ "Mod4" }, "c", function()
		-- awful.spawn(terminal .. " -e /home/anupam/scripts/cht.sh")
		awful.spawn(terminal .. " -e ollama run llama3.1:latest")
	end),
	awful.key({ "Mod4" }, "Return", function()
		--awful.spawn("tabbed -c -n alacritty alacritty --embed")
		-- awful.spawn("st -e zsh")
		awful.spawn(terminal)
	end),

	awful.key({ "Mod4" }, "n", function()
		awful.spawn(terminal .. " -e /home/anupam/scripts/tmux_opener.sh")
	end),

	awful.key({ "Mod4" }, "space", function()
		awful.spawn("/home/anupam/scripts/switch-keyboard.sh")
	end),

	awful.key({ "Mod4" }, "e", function()
		-- awful.spawn("/home/anupam/scripts/dmenuunicode.sh")
		awful.spawn("rofi -show emoji")
	end),

	awful.key({ "Mod4" }, "q", function()
		-- awful.spawn("/usr/bin/systemctl suspend")
	end),

	awful.key({ "Mod4" }, "b", function()
		awful.spawn("blueman-manager")
	end),

	awful.key({}, "Print", function()
		awful.spawn("/home/anupam/scripts/screenshot.sh")
	end),

	awful.key({ "Shift" }, "Print", function()
		awful.spawn("/home/anupam/scripts/color-picker.sh")
	end),

	-- wibox

	awful.key({ modkey, "Control" }, "f", function()
		-- wibox.mywibox.visible = false
		awful.screen.connect_for_each_screen(function(s)
			if s.mywibox.visible == true then
				s.mywibox.visible = false
			else
				s.mywibox.visible = true
			end
		end)
	end),
	-- my key bindings end

	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	-- awful.key({ modkey }, "w", function()
	-- 	mymainmenu:show()
	-- end, { description = "show main menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey }, "w", function()
		awful.screen.focus(1)
	end, {}),
	awful.key({ modkey }, "e", function()
		awful.screen.focus(2)
	end, {}),
	-- awful.key({ modkey, "Control" }, "j", function()
	-- 	awful.screen.focus_relative(1)
	-- end, { description = "focus the next screen", group = "screen" }),
	-- awful.key({ modkey, "Control" }, "k", function()
	-- 	awful.screen.focus_relative(-1)
	-- end, { description = "focus the previous screen", group = "screen" }),
	-- awful.key({ modkey }, "u", awful.client.urgent.jumpto,
	-- 	{ description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.swap.byidx(1)
		awful.client.focus.byidx(-1)
		-- awful.client.focus.history.previous()
		-- if client.focus then
		-- 	client.focus:raise()
		-- end
	end, { description = "go back", group = "client" }),

	-- Standard program
	-- awful.key({ modkey }, "Return", function(c)
	-- 	awful.spawn(terminal)
	-- end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),

	-- awful.key({ modkey }, "x", function()
	-- 	awful.prompt.run({
	-- 		prompt = "Run Lua code: ",
	-- 		textbox = awful.screen.focused().mypromptbox.widget,
	-- 		exe_callback = awful.util.eval,
	-- 		history_path = awful.util.get_cache_dir() .. "/history_eval",
	-- 	})
	-- end, { description = "lua execute prompt", group = "awesome" }),

	-- Menubar
	--    awful.key({ modkey }, "p", function() menubar.show() end,
	awful.key({ modkey }, "p", function()
		-- awful.spawn("rofi -show run -theme dmenu")
		awful.spawn("dmenu_run -i")
	end, { description = "show the menubar", group = "launcher" })
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "c", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "Return", function(c)
		awful.spawn(terminal)
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey, "Shift" }, "o", function(c)
		c:move_to_screen()
		awful.screen.focus_relative(-1)
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		for _, cls in ipairs(client.get()) do
			-- minimize all windows except the focused one
			-- if c.window ~= cls.window and c.first_tag == cls.first_tag then
			-- 	cls.minimized = not cls.minimized
			-- end
		end
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
			},
			class = {
				"Arandr",
				-- "Blueman-manager",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"Yad",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- force not floating
	{
		rule_any = {
			class = {
				-- "Pavucontrol",
				-- "Blueman-manager",
				-- "Cmus",
			},
		},
		properties = { floating = false, tag = "3" }
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	-- rounded border
	-- c.shape = gears.shape.rounded_rect

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	awful.titlebar(c):setup({
		{
			-- Left
			awful.titlebar.widget.iconwidget(c),
			buttons = buttons,
			layout = wibox.layout.fixed.horizontal,
		},
		{
			-- Middle
			{
				-- Title
				align = "center",
				widget = awful.titlebar.widget.titlewidget(c),
			},
			buttons = buttons,
			layout = wibox.layout.flex.horizontal,
		},
		{
			-- Right
			awful.titlebar.widget.floatingbutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.stickybutton(c),
			awful.titlebar.widget.ontopbutton(c),
			awful.titlebar.widget.closebutton(c),
			layout = wibox.layout.fixed.horizontal(),
		},
		layout = wibox.layout.align.horizontal,
	})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
-- }}}

-- my autorun programs i.e. autostart
local autorun = true
local autorunApps = {
	"picom",
	"nitrogen --restore",
	"clipmenud",
	-- "copyq",
	-- "qpwgraph -m",
	-- "blueman-manager",
	-- "pavucontrol",
	"/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1",
	-- "emacs --daemon",
	"aw-qt",
	-- "brave",
	-- terminal .. " --class Cmus -e cmus",
	"flameshot",
	-- "rog-control-center",
	-- "pasystray",
}

if autorun then
	for app = 1, #autorunApps do
		awful.util.spawn(autorunApps[app])
	end
end

-- hide the border for max windows / clients
-- screen.connect_signal("arrange", function(s)
-- 	local max = s.selected_tag.layout.name == "max"
-- 	local only_one = #s.tiled_clients == 1 -- use tiled_clients so that other floating windows don't affect the count
-- 	-- but iterate over clients instead of tiled_clients as tiled_clients doesn't include maximized windows
-- 	for _, c in pairs(s.clients) do
-- 		if (max or only_one) and not c.floating or c.maximized then
-- 			c.border_width = 0
-- 		else
-- 			c.border_width = beautiful.border_width
-- 		end
-- 	end
-- end)
