local M = {}

local function filter_items(items)
  local valid_items = {}

  for _, item in pairs(items) do
    if item and #item > 0 and item ~= '' and item ~= '\n' then
      table.insert(valid_items, item)
    end
  end

  return valid_items
end

local function split_items_string(items_string)
  local i = 1
  local result = {}
  for token in string.gmatch(items_string, '([^,]+),%s*') do
    table.insert(result, token)
    i = i + 1
  end
  return result
end

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
  items = filter_items(items)
  if #items == 1 and string.find(items[1], ',') then
    items = split_items_string(items[1])
  end
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
