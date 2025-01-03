local autocmd = vim.api.nvim_create_autocmd

autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert"
})
