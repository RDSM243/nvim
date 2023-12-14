local alpha = require("alpha")
local db = require("alpha.themes.dashboard")
local fortune = require("alpha.fortune")

-- Adjust the position of the dashboard on screen
local dbOffset = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) }

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

--Header description with a few information about nvim
local headerDesc = {
  type = "text",
  val = "",
  opts = {
    position = "center",
    hl = "String",
  },
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

db.section.footer.val = fortune()

local opts = {
  layout = {
    { type = "padding", val = dbOffset },
    db.section.header,
    { type = "padding", val = 0 },
    headerDesc,
    { type = "padding", val = 2 },
    db.section.buttons,
    { type = "padding", val = 0 },
    db.section.footer,
  },
  opts = {
    margin = 44,
  },
}

-- Send config of db to alpha
alpha.setup(opts)

vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyVimStarted',
	callback = function()
		local stats = require('lazy').stats()
		local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
		headerDesc.val = " Loaded "..stats.loaded.."/"..stats.count.." plugins in "..ms.."ms"
		pcall(vim.cmd.AlphaRedraw)
	end,
})

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
