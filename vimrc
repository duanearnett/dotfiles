" Super awesome VIM Configuration -
" - Duane Arnett
" - fortyau.com

" Plugins ----------------------------------------------------------------
" Activate pathogen
" call pathogen#infect()
call plug#begin('~/.vim/plugged')

" Themes
Plug 'kristijanhusak/vim-hybrid-material'

" Make VIM nicer
Plug 'rbgrouleff/bclose.vim'    " Close a buffer
" Plug 'embear/vim-localvimrc'  " Overwrite config per directory

" Tim Pope section
Plug 'tpope/vim-obsession'      " Better session management
Plug 'tpope/vim-dispatch'       " Async operations
Plug 'tpope/vim-fugitive'       " Git in vim
Plug 'tpope/vim-surround'

" Auto-correction for writing things
" Plug 'reedes/vim-wordy', { 'for': ['mail', 'markdown', 'text'] }
Plug 'reedes/vim-litecorrect', { 'for': ['mail', 'markdown', 'text'] }

" Editor niceties
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rizzatti/dash.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin'  }
Plug 'junegunn/fzf.vim'
" Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  } | Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle'  }
Plug 'scrooloose/syntastic'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'janko-m/vim-test'
Plug 'valloric/youcompleteme', { 'do': './install.py --tern-completer' }
Plug 'majutsushi/tagbar'
" Plug 'SirVer/ultisnips'       " Track the engine.
" Plug 'honza/vim-snippets'     " Snippets are separated from the engine. Add this if you want them:

Plug 'gko/vim-coloresque', { 'for': ['css', 'scss', 'less'] }

" CSVs
Plug 'chrisbra/csv.vim', { 'for': ['csv'] }

" CSS
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'html'] }

" HTML
Plug 'mattn/emmet-vim', { 'for': ['html', 'hbs', 'eelixir'] }
Plug 'mustache/vim-mustache-handlebars', { 'for': 'hbs' }

" HTML/XML
Plug 'othree/xml.vim', { 'for': ['html', 'xml'] }

" Jade/Pug
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }

" SCSS/SASS
Plug 'gcorne/vim-sass-lint', { 'for': ['scss', 'sass'] }

" Coffeescript
Plug 'mtscout6/vim-cjsx', { 'for': ['coffee'] }
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
" Plug 'lukaszkorecki/CoffeeTags', { 'for': ['coffee'] }

" Exlixir, erlang, etc
" https://github.com/slashmili/alchemist.vim
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir'] }
Plug 'slashmili/alchemist.vim', { 'for': ['elixir'] }

" PHP
Plug 'StanAngeloff/php.vim', { 'for': 'php' }


" Java
" TODO ...but first use the eclim plugin...
" TODO conditionally toggle the eclim plugin on and off

" Mail

call plug#end()

" Autocommands for mutt, etc
set spelllang=en_us
au BufRead,BufNewFile *mutt* set filetype=mail
autocmd FileType mail set spell

augroup litecorrect
  autocmd!
  autocmd FileType markdown,mkd call litecorrect#init()
  autocmd FileType mail call litecorrect#init()
augroup END


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
set clipboard=unnamedplus           " - Use the system clipboard inside vim

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
let g:ackprg = 'ag --vimgrep'

" -- Beep
set visualbell
set noerrorbells

" Backspace behaves as expected
set backspace=indent,eol,start
set hidden

" Leader keys mapping
" Uses the bclose script for some more sane buffer management
nnoremap <silent> <Leader>bd :Bclose<CR>
let bclose_multiple = 0

" Leader git commands
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gp :Dispatch! :Gpush<CR>

" Leader media commands
nnoremap <silent> <Leader>sp<SPACE> :Dispatch! !spotify play<CR>
nnoremap <silent> <Leader>spn :Dispatch! !spotify next<CR>
nnoremap <silent> <Leader>spp :Dispatch! !spotify prev<CR>
nnoremap <silent> <Leader>sps :Dispatch! !spotify pause<CR>
nnoremap <silent> <Leader>spr :Dispatch! !spotify replay<CR><CR>

nnoremap <silent> <Leader>d :Dispatch
nnoremap <silent> <Leader>b :Dispatch!

" Shows invisibles like we are used to with other editors
set listchars=tab:>-,trail:.,extends:>,precedes:<,nbsp:.
set list

" Show an 80 character vertical rule...
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")


" Removes trailing spaces on buffer write
function! TrimWhiteSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()


" Enable syntax highlighting
syntax enable

" -- Coffee support
" let g:CoffeeAutoTagDisabled=1     " Disables autotaging on save (Default: 0 [false])
" let g:CoffeeAutoTagFile=<filename>       " Name of the generated tag file (Default: ./tags)
" let g:CoffeeAutoTagIncludeVars=1  " Includes variables (Default: 0 [false])
" let g:CoffeeAutoTagTagRelative=1  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])

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

set guifont=Hack
set antialias
set fillchars=vert:│    " that's a vertical box-drawing character

" Airline
" let g:airline#extensions#tabline#enabled = 1
" air-line
let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

"  unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"
"" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

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


"  -- Ultinsnips config
"  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"  let g:UltiSnipsExpandTrigger="<Leader><tab>"
"  let g:UltiSnipsJumpForwardTrigger="<c-b>"
"  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"  " If you want :UltiSnipsEdit to split your window.
"  let g:UltiSnipsEditSplit="vertical"


" -- Java autocompletion (adding eclim to omnifunc to be picked up by YCM)
" let g:EclimCompletionMethod = 'omnifunc'

" -- Prose/lexical autocompletion
" let g:predictive#dict_path = expand($HOME . '/dotfiles/words')
" set dictionary=/usr/share/dict/words


" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" -- Hot keys
" Really save things when you didn't open the file as sudo
cmap w!! w !sudo tee % > /dev/null

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
" Quickly close a pane
nmap qq :q<CR>

" vim-test hotkeys
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Leader key to tidy up HTML
nmap <silent> <leader>f :!tidy -mi -html -wrap 0 %<CR>

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
set rtp+=~/.fzf

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

let g:syntastic_loc_list_height = 4
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint'] " Enable syntastic integration with
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_sass_checkers=["sasslint"]       " my default linting files
let g:syntastic_scss_checkers=["sasslint"]
let g:sass_lint_config = '~/Projects/Source/linters/.scss-lint.yml'

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
