local keymap = vim.keymap

--general keymaps
keymap.set("i", "jk", "<ESC>") -- go to command mode
keymap.set("i", "<C-s>", "<ESC>:w<CR>") -- save the code (INSERT)
keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
keymap.set("v", "<A-j>", ":m '>+1<CR>==")
keymap.set("v", "<A-k>", ":m '<-2<CR>==")
keymap.set("n", "<C-s>", ":w<CR>") -- save the code (NORMAL)
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear highlights
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
keymap.set("n", "<leader>ss", ":SearchSession<CR>") -- list all the saved sessions
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") --file explorer
keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear search highlights
keymap.set("t", "<Esc>", "<C-\\><C-n><CR>") --go from terminal to normal mode

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
