" --- Status Line Setup ---

" Change Color based on mode 
function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=Cyan ctermfg=81 guifg=Black ctermbg=232
    elseif a:mode == 'v'
        hi statusline guibg=Purple ctermfg=161 guifg=Black ctermbg=0
    else
        hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
    endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
" This is the default for molokai
au InsertLeave * hi statusline guibg=#455354 ctermfg=238 guifg=#455354 ctermbg=253

set laststatus=2 "enable statusline

set statusline=

set statusline+=%<\ %{toupper(mode())}%<\ " Show current mode

set statusline+=%#identifier# " Switch highlight
set statusline+=%<\ %t%<\     " File name
set statusline+=%#error#      " Switch highlight
set statusline+=%r            " Read Only flag
set statusline+=%#normal# " Switch highlight
set statusline+=\ >>
set statusline+=\ %{fugitive#statusline()}

set statusline+=%* " Switch highlight

" Error Count
"set statusline+=%#errormsg#
"set statusline+=%{youcompleteme#GetErrorCount()}
"set statusline+=%*

set statusline+=%=           " Switch to right side
set statusline+=%*           " Switch to normal statusline highlight
set statusline+=%<\          " cut at start
set statusline+=%y           " Filetype
set statusline+=\ %c\ :      " Cursor Column
set statusline+=\ %l%<\         " Line number 
