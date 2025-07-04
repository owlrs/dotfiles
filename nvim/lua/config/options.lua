-- vim.g.lazyvim_blink_main = true
vim.g.lazyvim_cmp = "blink.cmp"
vim.g.lazyvim_picker = "fzf"

-- Neovim Terminal
if vim.fn.has("win32") == 1 then
  -- if vim.fn.executable("zsh") == 1 then
  --   vim.o.shell = "zsh"
  -- elseif vim.fn.executable("bash") == 1 then
  --   vim.o.shekk = "bash"
  -- else
  vim.o.shell = "pwsh"
  -- end

  vim.o.shellcmdflag = "-NoLogo -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellredir = "2>&1 | Out-File %s; exit $LastExitCode"
  vim.o.shellpipe = "2>&1 | Tee-Object %s; exit $LastExitCode"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

-- Neovide Config
if vim.g.neovide then
  -- vim.o.guifont = "VictorMono Nerd Font Mono:h14"
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  vim.g.neovide_title_text_color = "white"
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_smooth_blink = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_antialiasing = false
  vim.g.neovide_cursor_vfx_mode = "railgun" -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
  vim.g.neovide_floating_blur_amount_x = 7.0
  vim.g.neovide_floating_blur_amount_y = 7.0
  vim.g.neovide_floating_corner_radius = 0.5
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_window_blurred = true
  vim.g.neovide_normal_opacity = 0.5
  vim.g.neovide_opacity = 1
  local alpha = function()
    return string.format("%x", math.floor(255 * 0.8))
  end
  vim.g.neovide_background_color = "#ffffff" .. alpha()
end
