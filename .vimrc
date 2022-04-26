syntax on
call plug#begin()
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tlhc/vim-yd-trans'
call plug#end()

if &diff
	colorscheme evening
endif

let mapleader=","
set number
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set backspace=2
set hlsearch

autocmd FileType python setlocal tabstop=2 shiftwidth=2 softtabstop=2

set foldenable
set foldmethod=syntax
set foldlevelstart=99

"universal-ctags
set tags=./.tags;,.tags

set cscopetag
set cscopeprg="gtags-cscope"

"gutentags
let g:gutentags_project_root = ['.git']
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_modules = []
if executable('ctags')
	let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif
let s:vim_tags =expand('/home/linearhit/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q', '--c++-kinds=+px', '--c-kinds=+px']
let g:gutentags_auto_add_gtags_cscope = 1
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
"let g:gutentags_trace = 1

"gutentags_plus
let g:gutentags_plus_switch = 1

"LeaderF"
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
let g:Lf_UseCache = 0
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

"gtags
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

"vim-preview
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> c :PreviewClose<cr>
"noremap <S-p> :PreviewGoto split<cr>
"noremap <S-v> :PreviewGoto vsplit<cr>
noremap <M-j> :PreviewScroll -1<cr>
noremap <M-k> :PreviewScroll +1<cr>
inoremap <M-j> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <M-k> <c-\><c-o>:PreviewScroll +1<cr>
noremap <F4> :PreviewSignature!<cr>
noremap <F4> <c-\><c-o>:PreviewSignature!<cr>

"git-gutter
nmap <leader>g :<Plug>(GitGutterToggle)
nmap <leader>u :<Plug>(GitGutterBufferToggle)
nmap <leader>t :<Plug>(GitGutterSignsToggle)
nmap <leader>n :<Plug>(GitGutterNextHunk)
nmap <leader>N :<Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_diff_base = 'origin/main'

"vim-airline
let g:airline_theme="molokai"
"let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
set guifont=Hermit:h12

"vim-yd-trans
nmap <silent> <c-s-K> <Esc>: GetWD<CR>
vmap <silent> <c-s-K> <Esc>: GetVWD<CR>
