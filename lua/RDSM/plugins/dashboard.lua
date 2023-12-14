local alpha = require("alpha")
local db = require("alpha.themes.dashboard")

-- Set header
db.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- Set menu
db.section.buttons.val = {
    db.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
    db.button( "f", "  Find file", ":Telescope find_files<CR>"),
    db.button( "t", "  Find text", ":Telescope live_grep<CR>"),
    db.button( "s", "  Search session", ":SearchSession<CR>"),
    db.button( "r", "  Recent file"   , ":Telescope oldfiles<CR>"),
    db.button( "l", "󰒲  Lazy" , ":Lazy<CR>"),
    db.button( "q", "  Quit", ":qa<CR>"),
}

-- Adjust the position of the dashboard on screen
db.config.layout[1].val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }
db.config.layout[3].val = 5

-- Send config of db to alpha
alpha.setup(db.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
