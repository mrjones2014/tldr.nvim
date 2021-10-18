if exists('g:loaded_tldr_nvim')
  finish
endif

lua require('telescope').load_extension('tldr')
command! Tldr :lua require('tldr').pick()

let g:tldr_root_dir = expand('<sfile>:p:h:h')

let g:loaded_tldr_nvim = 1
