if exists('g:loaded_tldr_nvim')
  finish
endif

lua require('telescope').load_extension('tldr')

let g:loaded_tldr_nvim = 1
