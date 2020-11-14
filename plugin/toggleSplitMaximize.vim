function! MaximizeToggle() "{{{
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction "}}}

command!  MaximizeToggle :call MaximizeToggle()  
nnoremap <C-W>z :MaximizeToggle()<CR>
nnoremap <C-W>Z :MaximizeToggle()<CR>

