" " Miscellaneous plugin settings

" --- vim-commentary ---
" Map the key for toggling comments
" nnoremap <leader>c :Commentary<CR>

" --- ctrlp ---
" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" Exclude some commonly excluded directories and stuff
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" --- NERDTree ---
nmap <silent> <leader>t :NERDTreeToggle<CR>

" --- ALE ---
let g:ale_linters = {
            \    'rust': ['rls'],
            \}
let g:ale_completion_enabled = 1

" --- maralla/completor ---
let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_racer_binary = '/home/kevin/.cargo/bin/racer'

" use tab to select completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

nmap <silent> <C-e> <Plug>(ale_previous_wrap)
nmap <silent> <C-E> <Plug>(ale_next_wrap)

" --- mxw/vim-jsx ---
let g:jsx_ext_required = 0
