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
        return { require('tldr.config').config.tldr_command, entry.value, '-p' }
      end,
    }),
  })

  return picker:find()
end

function M.health()
  -- health_start begins a new section
  local health_start = vim.fn['health#report_start']
  local health_ok = vim.fn['health#report_ok']
  local health_error = vim.fn['health#report_error']
  local health_info = vim.fn['health#report_info']

  health_start('tldr command')
  local configured_command = require('tldr.config').config.tldr_command
  if vim.fn.executable(configured_command) ~= 0 then
    health_ok('configured command "' .. configured_command .. '" found and is executable')
  else
    health_error('configured command "' .. configured_command .. '" not found or is not executable')

    if vim.fn.executable('tldr') ~= 0 then
      health_info('default command "tldr" is found and executable')
    end
  end
end

return M
