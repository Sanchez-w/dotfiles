if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.o.guifont = "Source Code Pro:h24" -- text below applies for VimScript
  vim.opt.linespace = 0
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_cursor_animation_length = 0.13 --Setting g:neovide_cursor_animation_length determines the time it takes for the cursor to complete it's animation in seconds. Set to 0 to disable.

  -- determines how much the trail of the cursor lags behind the front edge.
  vim.g.neovide_cursor_trail_size = 0.8

  -- Enables or disables antialiasing of the cursor quad. Disabling may fix some cursor visual issues.
  vim.g.neovide_cursor_antialiasing = true

  -- If disabled, when in insert mode (mostly through i or a), the cursor will move like in other programs and immediately jump to its new position.
  vim.g.neovide_cursor_animate_in_insert_mode = true

  -- Specify cursor outline width in ems. You probably want this to be a positive value less than 0.5. If the value is <=0 then the cursor will be invisible. This setting takes effect when the editor window is unfocused, at which time a block cursor will be rendered as an outline instead of as a full rectangle.
  vim.g.neovide_cursor_unfocused_outline_width = 0.125

  vim.g.neovide_cursor_animate_command_line = true

  -- If enabled, the cursor will smoothly animate the transition between the cursor's on and off state. The built in guicursor neovim option needs to be configured to enable blinking by having a value set for both blinkoff, blinkon and blinkwait for this setting to apply.
  vim.g.neovide_cursor_smooth_blink = false
end
