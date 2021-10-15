local M = {}

function M.setup(config)
  return require('tldr.config').setup(config)
end

function M.pick()
  local commands = require('tldr.utils').get_cmds(require('tldr.config').config.tldr_command)
  if not commands or #commands < 1 then
    vim.api.nvim_err_write('No commands found in tldr cache. Maybe you need to run `tldr --update`?')
    return
  end

  local Picker = require('telescope.pickers')
  local Finder = require('telescope.finders')
  local Sorter = require('telescope.sorters')

  local finder_fn = Finder.new_table({
    results = commands,
    entry_maker = require('tldr.utils').entry_maker,
  })

  local picker = Picker:new({
    prompt_title = 'tldr',
    finder = finder_fn,
    sorter = Sorter.get_generic_fuzzy_sorter(),
    previewer = require('telescope.previewers').new_termopen_previewer({
      get_command = function(entry)
        return { require('tldr.config').config.tldr_command, entry.value }
      end,
    }),
  })

  return picker:find()
end

return M
