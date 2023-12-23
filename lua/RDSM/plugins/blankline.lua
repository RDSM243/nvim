local blankline_status, blankline = pcall(require, "ibl")
if not blankline_status then
	return
end

blankline.setup({
  indent = {  highlight = { "Whitespace" }, char = "│" },
  whitespace = {
      highlight = { "Whitespace" },
  },
  scope = { enabled = true },
})
