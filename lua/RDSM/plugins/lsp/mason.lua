-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_tool_status, mason_tool_installer = pcall(require, "mason-tool-installer")
if not mason_tool_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"clangd",
		"lua_ls",
		"pyright",
		"emmet_ls",
		"rust_analyzer",
	},

	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_tool_installer.setup({
	ensure_installed = {
		"stylua", -- lua formatter
		"flake8", -- python linter
		"eslint_d", -- js linter
	},
	run_on_start = true,
})
