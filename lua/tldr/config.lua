local M = {}

M.config = { tldr_command = 'tldr', tldr_args = '' }

function M.setup(new_config)
  new_config = new_config or {}
  M.config.tldr_command = new_config.tldr_command or M.config.tldr_command
  M.config.tldr_args = new_config.tldr_args or M.config.tldr_args
  return M.config
end

return M
