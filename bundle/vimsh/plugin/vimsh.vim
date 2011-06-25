let g:vimsh_sh="/bin/bash"
let g:vimsh_pty_prompt_override=0
let g:vimsh_show_workaround_msgs=0

function! VimShRedraw()
  redraw
endf

function! VimShNew()
  if ! exists("g:vimsh_loaded_python_file")
    pyfile vimsh.py
    let g:vimsh_loaded_python_file=1
  endif
  python spawn_buf('_vimsh_')
endf

function! VimShRun(text)
  " Called on a string or on a list of lines
  " Executes the lines in the VimSh window, one by one
  " (to allow for secondary prompts and/or incremental evaluation)

  " Parse argument
  let t = type(a:text)
  if t == 1
    let lines = split(a:text, '\n')
  elseif t == 3
    let lines = a:text
  else
    echoerr 'Argument is neither a list nor a string'
    return
  endif

  " Find VimSh window
  let win = bufwinnr('_vimsh_')
  if win == -1
    echohl WarningMsg
    echomsg 'Cannot find vimsh window'
    echohl None
    return
  endif

  " Execute commands
  exec win . 'wincmd w'
  for line in lines
    call setline('$', getline('$') . line)
    python lookup_buf('_vimsh_').execute_cmd()
    redraw
    sleep 1m "why do I need a sleep to apply the redraw?
  endfor
  stopinsert
  wincmd p
  echo
endf

function! VimShRunOp(type, ...)
  " Helper function (copied verbatim from Vim help)

  let sel_save = &selection
  let &selection = "inclusive"
  let reg_save = @@

  if a:0
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    silent exe "normal! `[\<C-V>`]y"
  else
    silent exe "normal! `[v`]y"
  endif

  call VimShRun(@@)

  let &selection = sel_save
  let @@ = reg_save
endf

nmap <leader>Sn :call VimShNew()<CR>
nnoremap <leader>S  :set opfunc=VimShRunOp<CR>g@
vnoremap <leader>S  :<C-U>call VimShRunOp(visualmode(), 1)<CR>
nnoremap <leader>SS :call VimShRun(getline('.'))<CR>
nnoremap <leader>Sf :call VimShRun(getline(1,'$'))<CR>
nmap <leader>St :norm 99[(<CR>vabS
