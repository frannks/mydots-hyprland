-- =======================================================
--                        COLORIZER
-- =======================================================
-- Inicializa o colorizer
require'colorizer'.setup()

-- Ativa o Colorizer automaticamente em cada buffer aberto ou criado
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
    pattern = "*",
    callback = function()
        require'colorizer'.attach_to_buffer(0)
    end
})
