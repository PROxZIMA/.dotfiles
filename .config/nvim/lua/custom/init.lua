vim.cmd("cd " .. vim.fn.expand("%:p:h"))
vim.cmd("function! TbToggle_theme(a,b,c,d) \n lua require('base46').toggle_theme() \n endfunction")
vim.o.guifont = "CaskaydiaCove Nerd Font,Operator Mono SSm Lig Book,FiraCode Nerd Font,Hack Nerd Font Mono,codicon:h11"
vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_create_user_command("Config", [[edit $MYVIMRC]], {})
vim.api.nvim_create_user_command("ConfigReload", require "custom.reload", {})

-- local modifiedBufs = function(bufs)
--     local t = 0
--     for k,v in pairs(bufs) do
--         if v.name:match("NvimTree_") == nil then
--             t = t + 1
--         end
--     end
--     return t
-- end

-- vim.api.nvim_create_autocmd("BufEnter", {
--     nested = true,
--     callback = function()
--         if #vim.api.nvim_list_wins() == 1 and
--         vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
--         modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
--             vim.cmd "quit"
--         end
--     end
-- })

if vim.fn.exists("vim.g.neovide") then
    vim.g.neovide_transparency=0
    vim.g.neovide_floating_blur_amount_x=2.0
    vim.g.neovide_floating_blur_amount_y=2.0
    vim.g.neovide_remember_window_size=true
    vim.g.neovide_cursor_vfx_mode = "pixiedust"
    vim.g.neovide_cursor_vfx_opacity=200.0
    vim.g.neovide_cursor_vfx_particle_lifetime=1.2
    vim.g.neovide_cursor_vfx_particle_density=10.0
    vim.g.neovide_cursor_vfx_particle_speed=10.0
    vim.o.guifont = "CaskaydiaCove Nerd Font,Operator Mono SSm Lig Book,FiraCode Nerd Font,Hack Nerd Font Mono,codicon:h8"
end
