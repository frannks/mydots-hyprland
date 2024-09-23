-- =======================================================
--                       BUFFERLINE
-- =======================================================
require('bufferline').setup {
    options = {
        mode = "buffers",
        numbers = "ordinal",
        indicator = {
            icon = '▎',
            style = 'underline',
        },
        buffer_colose_icon = '󰅖',
        modifed_icon = ' ',
        close_icon = '',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',

    },
}
