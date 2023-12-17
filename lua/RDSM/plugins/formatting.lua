local conform_status, conform = pcall(require, "conform")
if not conform_status then
  return
end

conform.setup({
  formatters_by_ft = {
   lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})
