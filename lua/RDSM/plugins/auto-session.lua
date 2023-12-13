local status_ok, session_lens = pcall(require, "session-lens")
if not status_ok then
  return
end

local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then
  return
end

auto_session.setup({
  log_level = 'info',
  auto_session_enable_last_session = false,
  auto_session_enabled = true,
  auto_session_create_enabled = false,
  auto_save_enabled = false,
  auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = nil,
  pre_save_cmds = { "NvimTreeClose" },
  -- the configs below are lua only
  bypass_session_save_file_types = nil
})

session_lens.setup({
  path_display = {'shorten'},
})
