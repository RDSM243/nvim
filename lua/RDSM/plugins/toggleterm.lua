local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  direction = 'float',
  --direction = 'horizontal',
  --size = 10,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  close_on_exit = true,
})
