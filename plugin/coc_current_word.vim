if exists('g:coc_current_word_loaded') && g:coc_current_word_loaded
  finish
endif
let g:coc_current_word_loaded = 1

" Get/set defaults
let g:coc_current_word_enabled = get(g:, 'coc_current_word#enabled', 1)
let g:coc_current_word_highlight_delay = get(g:, 'coc_current_word_highlight_delay', 0)
let g:coc_current_word_filetypes = get(g:, 'coc_current_word_filetypes', ['*'])

" Define default highlights and link `CocHighlightText` to `CurrentWord`
" to be compatible with `vim_current_word`
highlight link CocHighlightText CurrentWord
highlight default link CurrentWord Search

augroup coc_current_word
  autocmd!
  execute 'autocmd FileType ' .
        \ join(g:coc_current_word_filetypes, ',') .
        \ ' call coc_current_word#setup_autocommands()'
augroup END

command! CocCurrentWordToggle call coc_current_word#coc_current_word_toggle()
