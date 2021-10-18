return require('telescope').register_extension({
  setup = function(config)
    require('tldr').setup(config)
  end,
  health = function()
    require('tldr').health()
  end,
  exports = {
    tldr = function()
      require('tldr').pick()
    end,
  },
})
