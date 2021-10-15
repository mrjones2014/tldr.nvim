# tldr.nvim

A Telescope previewer for [tldr-pages](https://github.com/tldr-pages).

>The tldr-pages project is a collection of community-maintained help pages for command-line tools, that aims to be a simpler, more approachable complement to traditional [man pages](https://en.wikipedia.org/wiki/Man_page).

![screenshot](./assets/screencap.png)

## Install

With packer:

```lua
use({ 'mrjones2014/tldr.nvim', requires = { 'nvim-telescope/telescope.nvim' } })
```

You will also need a `tldr` client installed.

- [tealdeer](https://github.com/dbrgn/tealdeer) - fastest, requires `cargo` (part of the Rust toolchain) to install
- [tldr Node client](https://github.com/tldr-pages/tldr-node-client) - requires Node and `npm` to install
- [tldr Python client](https://github.com/tldr-pages/tldr-python-client) - requires Python and `pip` to install

## Config

You can configure the `tldr` command used by calling `setup()` or in your Telescope config:

```lua
require('tldr').setup({ tldr_command = 'tldr' })

-- or

require('telescope').setup({
  extensions = {
    tldr = {
      tldr_command = 'tldr'
    }
  }
})
```

## Usage

`:Telescope tldr` or `:Tldr` or `:lua require('tldr').pick()`
