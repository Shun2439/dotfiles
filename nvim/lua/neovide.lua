vim.o.guifont="Moralerspace Radon HWNF:h14" -- text below applies for VimScript

-- Helper function for transparency formatting
local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.8
vim.g.transparency = 0.8

vim.g.neovide_window_blurred = true

vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

vim.g.neovide_scroll_animation_length = 0.3

vim.g.neovide_cursor_animation_length = 0.13

vim.g.neovide_cursor_animate_in_insert_mode = true

vim.g.neovide_cursor_vfx_mode = "railgun"

