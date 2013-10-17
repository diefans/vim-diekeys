" PythonTidy
map <leader>t :%!pythontidy -c ~/.pythontidyrc<CR>

" PyLint
map <leader>p :PyLint<CR>

" ctrlp buffers
map  <leader>b * :<C-U>CtrlPBuffer<CR>


" Ctrl + A    Go to the beginning of the line you are currently typing on
imap <C-A> <home>

" Ctrl + E    Go to the end of the line you are currently typing on
imap <C-E> <end>

" Ctrl + L                Clears the Screen, similar to the clear command

" Ctrl + U    Clears the line before the cursor position. If you are at the end of the line, clears the entire line.
map <C-U> <C-O>d^


" Ctrl + H    Same as backspace
imap <C-H> <C-O>x

" Ctrl + R    Let’s you search through previously used commands
" Ctrl + C    Kill whatever you are running
" Ctrl + D    Exit the current shell
" Ctrl + Z    Puts whatever you are running into a suspended background process. fg restores it.

" Ctrl + W    Delete the word before the cursor
imap <C-W> <C-O>db

" Ctrl + K    Clear the line after the cursor
imap <C-K> <C-O>d$

" Ctrl + T    Swap the last two characters before the cursor
" Esc + T     Swap the last two words before the cursor
" Alt + F     Move cursor forward one word on the current line
" Alt + B     Move cursor backward one word on the current line

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" insert e new line and not enter insert
map <S-Enter> O<Esc>
map <CR> o<Esc>


" moving
map <Up> gk
map <Down> gj
map j gj
map k gk

nnoremap ; :

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" for enforce sudo afterwards
cmap w!! w !sudo tee % >/dev/null

" format paragraph
map <F4> vipgq
imap <F4> <ESC><F4>

" shift-insert
imap <silent> <S-Insert> <C-R>*
nnoremap <S-Insert> "+P
cnoremap <S-Insert> <C-r>*

" paste toggle
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>

" hg stuff
"vmap <leader>ha :<C-U>!hg annotate -udqc % \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep search word under cursor
"nmap <leader>g :Grep -nRI <cword> .<CR>
"command -nargs=1 RGrep :Grep -nRI <args> .

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle Highlight
nnoremap <silent> <expr> <F11> Highlighting()

" some underlines
nnoremap <leader>_- yyp<c-v>$r-
nnoremap <leader>_⁻ yyp<c-v>$r⁻
nnoremap <leader>_= yyp<c-v>$r=
nnoremap <leader>_⁼ yyp<c-v>$r⁼
nnoremap <leader>__ yyp<c-v>$r_
nnoremap <leader>_* yyp<c-v>$r*
nnoremap <leader>_# yyp<c-v>$r#
nnoremap <leader>_~ yyp<c-v>$r~
nnoremap <leader>_" yyp<c-v>$r"
nnoremap <leader>_^ yyp<c-v>$r^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffers
map <F1> :ls<CR>
map <leader>\ :b #<CR>
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
map <leader>0 :b 10<CR>
map  :bw<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickfix toggle \´
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>e :call ToggleList("Quickfix List", 'c')<CR>
command! -bang -nargs=? LocL call ToggleList("Location List", 'l')
command! -bang -nargs=? QFix call ToggleList("Quickfix List", 'c')
nmap <silent> \ß :LocL<CR>
nmap <silent> \q :QFix<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"map <leader>n :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map  :NERDTreeToggle \| :silent NERDTreeMirror<CR>
map <F5> :NERDTreeToggle \| :silent NERDTreeMirror<CR>
"imap  :NERDTreeToggle \| :silent NERDTreeMirror<CR>
"map  :NERDTreeToggle \| :silent NERDTreeMirror<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabs
" Shortcut to rapidly toggle `set list`
"map <C-S-PageUp> :tabp<CR>
"map <XF86Back> :tabp<CR>
nmap <F36> :tabp<CR>
imap <F36> <esc>:tabp<CR>
nmap <S-F36> :bprevious<CR>
imap <S-F36> <esc>:bprevious<CR>
nmap <C-M-Left> :tabp<CR>
imap <C-M-Left> :tabp<CR>
nmap [1;10D :tabp<CR>
imap [1;10D :tabp<CR>
nmap <M-S-Left> :tabp<CR>
imap <M-S-Left> :tabp<CR>
nmap <M-D-Left> :tabp<CR>
imap <M-D-Left> :tabp<CR>
"map [5^ :tabp<CR>


"map <C-S-PageDown> :tabn<CR>
"map <XF86Forward> :tabn<CR>
nmap <F37> :tabn<CR>
imap <F37> <esc>:tabn<CR>
nmap <S-F37> :bnext<CR>
imap <S-F37> <esc>:bnext<CR>
nmap <C-M-Right> :tabn<CR>
imap <C-M-Right> :tabn<CR>
nmap [1;10C :tabn<CR>
imap [1;10C :tabn<CR>
nmap <M-S-Right> :tabn<CR>
imap <M-S-Right> :tabn<CR>
nmap <M-D-Right> :tabn<CR>
imap <M-D-Right> :tabn<CR>
"map [6^ :tabn<CR>

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" strip trailing white spaces
function! StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
    endfunction
map <leader>w :call StripTrailingWhitespaces()<CR>

" taglist
nnoremap <silent> <F6> :TlistToggle<CR>

" show line numbering
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Ctrl-{direction} to scroll-up
map <C-k> <C-y>
map <C-up> <C-y>
imap <C-up> <C-o><C-y>
" -down
map <C-j> <C-e>
map <C-down> <C-e>
imap <C-down> <C-o><C-e>
" -left
"map <C-left> 2zh
"imap <C-left> <C-o>2zh
" -right
"map <C-right> 2zl
"imap <C-right> <C-o>2zl

" disable Shift-{up,down}
"map <S-k> k
"map <S-up> <up>
"imap <S-up> <up>
" -down
"map <S-j> j
"map <S-down> <down>
"imap <S-down> <down>

" Shift-{left,right} moves by WORDS
map <S-left> B
imap <S-left> <C-o>B
" -down
map <S-right> W
imap <S-right> <C-o>W

" {k,j,up,down} go up and down visually
map k gk
map j gj
map <up> gk
map <down> gj

" <return> controls folds
"map <return> za
"map <S-return> zA
"map <C-return> zR
"map <C-A-return> zM

" Undo/redo using Alt-{left,right}
nmap <A-left> u
nmap <A-right> <C-r>

" Ctrl-page{up,down} navigates open files
nmap <C-M-Up> :bN<CR>
nmap <C-M-Down> :bn<CR>
imap <C-M-Up> <esc>:bN<CR>
imap <C-M-Down> <esc>:bn<CR>
"
" <home> toggles between start of line and start of text
imap <khome> <home>
nmap <khome> <home>
inoremap <silent> <home> <C-O>:call Home()<return>
nnoremap <silent> <home> :call Home()<return>
function! Home()
    let curcol = wincol()
    normal ^
    if wincol() == curcol
        normal 0
    endif
endfunction

" <tab> indents in visual mode
vmap <tab> >
vmap <s-tab> <
" <tab><tab> indents without visual selection
nmap <tab><tab> >>
nmap <s-tab><s-tab> <<

" bring back Q: format paragraph containing cursor
nnoremap Q gwap
" Q for visual mode, too
vnoremap Q gw

" typos
"  cnoreabbr W w
"  cnoreabbr Wq wq
"
" Some key bindings from other editors
"nmap <c-d> yyp`[
"vmap <c-d> y[p
"nmap <c-l> dd
"nmap <c-s> :update<return>
"nmap <c-w> :q<return>
"nmap <c-q> :qa<return>

