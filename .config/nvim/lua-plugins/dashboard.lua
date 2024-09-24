local db = require("dashboard")

db.setup({
    theme = 'doom',
    config = {
        header = {
            "", "", "", "", 
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "", "", "", 
        },
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'New File            ',
                desc_hl = 'String',
                key = 'n',
                keymap = 'SPC o',
                key_hl = 'Number',
                key_format = ' %s',
                action = function() db.new_file() end,
            },
            {
                icon = ' ',
                desc = 'Browse Files        ',
                key = 'b',
                keymap = 'SPC n',
                key_format = ' %s',
                action = function()
                    require("telescope").extensions.file_browser.file_browser()
                end,
            },
            {
                icon = ' ',
                desc = 'Find File           ',
                key = 'f',
                keymap = 'SPC f',
                key_format = ' %s',
                action = 'Telescope find_files',
            },
            {
                icon = ' ',
                desc = 'Old Files',
                key = 'o',
                keymap = 'SPC o',
                key_format = ' %s',
                action = 'Telescope oldfiles',
            },

            {
                icon = ' ',
                desc = 'Configure Neovim    ',
                key = 'c',
                keymap = 'SPC v',
                key_format = ' %s',
                action = 'edit ~/.config/nvim/init.vim',
            },
            {
                icon = ' ',
                desc = 'Exit Neovim        ',
                key = 'e',
                keymap = 'SPC q',
                key_format = ' %s',
                action = 'quit',
            },
        },
        footer = {
            "Keep It Simple, Stupid."
        },
    }
})
-- Configuração da tecla de atalho global (opcional)
vim.keymap.set("n", "<space>fb", function()
    require("telescope").extensions.file_browser.file_browser()
end)
