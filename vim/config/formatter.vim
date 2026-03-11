
"nnoremap <silent> <leader>t :FiletypeFormat<cr>
"vnoremap <silent> <leader>t :FiletypeFormat<cr>

let g:vim_filetype_formatter_commands = {
      \ 'haskell': 'fourmolu --ghc-opt -XTypeApplications --ghc-opt -XBangPatterns'
      \ }

"We don't want any of the default formatters here
let g:vim_filetype_formatter_ft_no_defaults = [
      \ 'bib',
      \ 'css',
      \ 'go',
      \ 'html',
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'javascriptreact',
      \ 'jinja.html',
      \ 'json',
      \ 'jsonc',
      \ 'markdown',
      \ 'nginx',
      \ 'ocaml',
      \ 'python',
      \ 'rust',
      \ 'svelte',
      \ 'terraform',
      \ 'toml',
      \ 'typescript',
      \ 'typescript.tsx',
      \ 'typescriptreact',
      \ 'yaml',
      \ 'yaml.docker-compose'
      \ ]
