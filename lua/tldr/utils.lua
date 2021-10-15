local M = {}

function M.get_cmds(tldr_cmd)
  local items = {}
  require('plenary.job')
    :new({
      command = tldr_cmd,
      args = { '--list' },
      cwd = vim.fn.getcwd(),
      enabled_recording = true,
      on_exit = function(j, return_val)
        if return_val .. '' == '0' then
          items = j:result()
        end
      end,
    })
    :sync()
  return items
end

function M.entry_maker(cmd)
  return {
    value = cmd,
    display = cmd,
    ordinal = cmd,
  }
end

return M
