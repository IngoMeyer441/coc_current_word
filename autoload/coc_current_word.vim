let g:coc_current_word_disabled_by_insert_mode = 0
let g:coc_current_word_timer_id = 0


" Setup needed autocommands for this plugin to work in the current buffer
function! coc_current_word#setup_autocommands()
  augroup coc_current_word_buffer
    autocmd! * <buffer>
    autocmd CursorMoved <buffer> call coc_current_word#pre_highlight()
    autocmd InsertEnter <buffer> call coc_current_word#handle_insert_enter()
    autocmd InsertLeave <buffer> call coc_current_word#handle_insert_leave()
  augroup END
endfunction

" Clear previously scheduled highlight
function! coc_current_word#clear_scheduled_highlight()
  if g:coc_current_word_timer_id
    call timer_stop(g:coc_current_word_timer_id)
    let g:coc_current_word_timer_id = 0
  endif
endfunction

" Perform highlight with delay
function! coc_current_word#schedule_highlight()
  call coc_current_word#clear_scheduled_highlight()
  let g:coc_current_word_timer_id = timer_start(g:coc_current_word_highlight_delay, 'coc_current_word#highlight_word_under_cursor')
endfunction

" Schedule highlight or do it instantly
function! coc_current_word#pre_highlight()
  let l:coc_current_word_disabled_in_this_buffer = get(b:, 'coc_current_word_disabled_in_this_buffer', 0)
  if !g:coc_current_word_enabled || l:coc_current_word_disabled_in_this_buffer | return 0 | endif
  if g:coc_current_word_highlight_delay
    call coc_current_word#schedule_highlight()
  else
    call coc_current_word#highlight_word_under_cursor()
  end
endfunction

" Toggle plugin
function! coc_current_word#coc_current_word_toggle()
  if g:coc_current_word_enabled == 1
    call coc_current_word#coc_current_word_disable()
  else
    call coc_current_word#coc_current_word_enable()
  endif
endfunction

" Disable plugin until insert leave
function! coc_current_word#handle_insert_enter()
  if !g:coc_current_word_enabled | return 0 | endif
  let g:coc_current_word_disabled_by_insert_mode = 1
  call coc_current_word#coc_current_word_disable()
endfunction

" Enable plugin after insert leave
function! coc_current_word#handle_insert_leave()
  if !g:coc_current_word_disabled_by_insert_mode | return 0 | endif
  let g:coc_current_word_disabled_by_insert_mode = 0
  call coc_current_word#coc_current_word_enable()
endfunction

" Enable plugin
function! coc_current_word#coc_current_word_enable()
  let g:coc_current_word_enabled = 1
  call coc_current_word#pre_highlight()
endfunction

" Disable plugin
function! coc_current_word#coc_current_word_disable()
  call coc_current_word#clear_scheduled_highlight()
  let g:coc_current_word_enabled = 0
endfunction

" Request word highlighting (depends on coc.nvim highlighting feature)
function! coc_current_word#highlight_word_under_cursor(...)
  call CocActionAsync('highlight')
endfunction
