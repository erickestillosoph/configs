local wezterm = require 'wezterm'




return {
  
  initial_cols = 220,
  initial_rows = 50,
  
	adjust_window_size_when_changing_font_size = false,
	-- color_scheme = 'termnial.sexy',
	color_scheme = 'Catppuccin Mocha',
	enable_tab_bar = false,
	font_size = 14.0,
	font = wezterm.font('JetBrains Mono'),
  window_close_confirmation = 'NeverPrompt',  
	-- macos_window_background_blur = 40,
  
	macos_window_background_blur = 25,
  window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	
	-- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- },
	-- window_background_opacity = 0.92,
	-- window_background_opacity = 1.0,
	window_background_opacity = 0.40,

  window_background_gradient = {
    orientation = 'Vertical',
    colors = { '#03001e', '#480067', '#333399', '#03001e' },
    interpolation = 'CatmullRom',
    blend = 'Rgb',    
  },
  window_frame = {
    border_left_width = '0.5cell',
    border_right_width = '0.5cell',
    border_bottom_height = '0.5cell',
    border_top_height = '0.5cell',
    
  },
  
  
	-- window_background_opacity = 0.20,
	window_decorations = 'RESIZE',
  colors = {
    tab_bar = {
      background = "#1e1e2e",
      active_tab = {
        bg_color = "#282c34",
        fg_color = "#2cff05",
      },
      inactive_tab = {
        bg_color = "#1e1e2e",
        fg_color = "#808080",
      },
      inactive_tab_hover = {
        bg_color = "#3b3b4b",
        fg_color = "#2cff05",
      },
      new_tab = {
        bg_color = "#1e1e2e",
        fg_color = "#808080",
      },
      new_tab_hover = {
        bg_color = "#3b3b4b",
        fg_color = "#c0caf5",
      },
    },
  },
	keys = {
		{
			key = 'q',
			mods = 'CTRL',
			action = wezterm.action.ToggleFullScreen,
		},
    {
			key = '\'',
			mods = 'CTRL',
			action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
		},
    {
      key = 'Enter',
      mods = 'CMD',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'Enter',
      mods = 'CMD|SHIFT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
      key = 't',
      mods = 'CMD',
      action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
      key = 'j',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      key = 'i',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      key = 'k',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ActivatePaneDirection 'Down',
    }, 
	},
	mouse_bindings = {
	  -- Ctrl-click will open the link under the mouse cursor
	  { 
	    event = { Up = { streak = 1, button = 'Left' } },
	    mods = 'CTRL',
	    action = wezterm.action.OpenLinkAtMouseCursor,
	  },
	},
}
