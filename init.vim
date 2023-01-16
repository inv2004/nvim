call plug#begin()

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'alaviss/nim.nvim'
Plug 'dense-analysis/ale'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
"Plug 'preservim/nerdcommenter'
"Plug 'numToStr/Comment.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'pechorin/any-jump.vim'
Plug 'fatih/vim-go'
" Plug 'pwntester/octo.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-smooth-scroll'
Plug 'sindrets/diffview.nvim'


call plug#end()

" let mapleader=","
" noremap <leader>, ,
set number
set relativenumber
set nofoldenable
set scrolloff=10
set clipboard=unnamedplus
let g:codedark_transparent=1
colorscheme codedark

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:ale_linters = {
\   'nim': ['nimlsp', 'nimcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'nim': ['nimpretty'],
\}
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
let g:ale_linters_explicit = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Yellow

nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

"lua require('Comment').setup()
lua require('lualine').setup()
lua require("bufferline").setup()

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 20, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 20, 4)<CR>

nnoremap q b

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
