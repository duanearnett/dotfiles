" Super awesome VIM Configuration - 
" - Duane Arnett
" - fortyau.com 

" Activate pathogen
call pathogen#infect()
let syntastic_mode_map = { 'passive_filetypes': ['html']  }
set nocompatible
set noswapfile
set nobackup
set nocursorcolumn
set nocursorline
set norelativenumber
set foldmethod=manual
set noesckeys
set timeoutlen=1000 ttimeoutlen=0

" -- Display
set title
set number
set ruler
set wrap
set autoindent

set scrolloff=3
set guioptions=T

" -- Default editorconfig
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set nowrap      " Disable softwrap


" -- Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" -- Beep
set visualbell
set noerrorbells

" Backspace behaves as expected
set backspace=indent,eol,start
set hidden

" Uses the bclose script for some more sane buffer management
let bclose_multiple = 0

" Shows invisibles like we are used to with other editors
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:.
set list

" Enable syntax highlighting
syntax enable

" -- Coffee support
let g:CoffeeAutoTagDisabled=1     " Disables autotaging on save (Default: 0 [false])
" let g:CoffeeAutoTagFile=<filename>       " Name of the generated tag file (Default: ./tags)
let g:CoffeeAutoTagIncludeVars=1  " Includes variables (Default: 0 [false])
let g:CoffeeAutoTagTagRelative=1  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

" -- Themes!
set background=dark
colorscheme hybrid_material 
let g:airline_theme="hybrid"
let g:enable_bold_font =1


"" Enable file specific behavior like syntax highlighting and indentation 
filetype on
filetype plugin on 
filetype indent on
""" Stagebloc sbt files should be associated with HTML
au BufRead,BufNewFile *.sbt setfiletype html 

" set guifont=DejaVu\ Sans\ Mono\ 13 
" set antialias

" Airline
" let g:airline#extensions#tabline#enabled = 1

" -- ctrp config
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 150
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*/tmp/*,*.so,*.tmp/,*/node_modules,*/dist,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](doc|tmp|.tmp|node_modules|dist)',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" -- NERDtree config
let NERDTreeShowHidden=1
let g:NERDTreeIgnore=['\~$', 'vendor', 'tmp', '.tmp', 'dist', 'node_modules', 'bower_components']

let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

" make test commands execute using dispatch.vim
" let test#strategy = "dispatch"
 
" -- Hot keys
" Disabling the directional keys
map <up> <nop>
map <down> <nop> 
map <left> <nop> 
map <right> <nop> 
imap <up> <nop> 
imap <down> <nop> 
imap <left> <nop> 
imap <right> <nop>

" Avoid using the <esc> key
imap ii <Esc>

" vim-test hotkeys
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Open dash.app under the current cursor
nmap <C-h> :Dash<CR>

" easily insert blank lines above and below without Insert mode
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" NERDtree toggle
map <C-\> :NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

" FZF setup
" https://github.com/junegunn/fzf.vim
set rtp+=/usr/local/opt/fzf

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" " - down / up / left / right
let g:fzf_layout = { 'down': '~40%'  }

"" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew'  }
let g:fzf_layout = { 'window': '-tabnew'  }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" " CTRL-N and CTRL-P will be automatically bound to next-history and
" " previous-history instead of down and up. If you don't like the change,
" " explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Syntastic 
" Feedback for linters and syntax errors
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']


" CTAGS Tagbar config for various languages...
let g:tagbar_type_elixir = {
    \ 'ctagstype' : 'elixir',
    \ 'kinds' : [
        \ 'f:functions',
        \ 'functions:functions',
        \ 'c:callbacks',
        \ 'd:delegates',
        \ 'e:exceptions',
        \ 'i:implementations',
        \ 'a:macros',
        \ 'o:operators',
        \ 'm:modules',
        \ 'p:protocols',
        \ 'r:records'
    \ ]
\ }
