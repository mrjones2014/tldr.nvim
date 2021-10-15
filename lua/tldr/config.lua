local M = {}

M.config = { tldr_command = 'tldr' }

function M.setup(new_config)
  new_config = new_config or {}
  M.config.tldr_command = new_config.tldr_command or M.config.tldr_command
  return M.config
end

return M
