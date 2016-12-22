syntax enable
let g:python_host_prog='/usr/bin/python2'
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"set clipboard+=unnamedplus
let g:deoplete#enable_at_startup = 1

" set nocompatible " use vim defaults
" filetype off " filetype needs to be off before Vundle
" set guifont=Fura\ Code\ Nerd\ Font\ Complete\ 10
" set encoding=utf-8

call plug#begin('~/.config/nvim/plugged')
" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jistr/vim-nerdtree-tabs'
" Limelight
Plug 'junegunn/limelight.vim'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'Valloric/YouCompleteMe'
" The git plugin
Plug 'tpope/vim-fugitive'
" The git gutter status 
Plug 'airblade/vim-gitgutter'
""Plug 'vim-scripts/AutoClose'
" Autolclose
Plug 'Raimondi/delimitMate'
" The powerline plugin and powerline for buffer plugin
Plug 'itchyny/lightline.vim'
Plug 'taohex/lightline-buffer'
" Colorscheme
Plug 'romainl/Apprentice'
function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" nerdtree-git
Plug 'Xuyuanp/nerdtree-git-plugin'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"Go Plugin"
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Saving session state
Plug 'tpope/vim-obsession'
" Syste clipboard copy
Plug 'christoomey/vim-system-copy'
" Editorconfig
Plug 'editorconfig/editorconfig-vim'
" The undo plugin
Plug 'simnalamburt/vim-mundo'
" The Autotag plugin 
Plug 'ludovicchabant/vim-gutentags'
" The material theme plugin 
" Plug 'kristijanhusak/vim-hybrid-material'
" Rails plugin 
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
" Tagbar
Plug 'majutsushi/tagbar'
" Syntax checker
" Plug 'scrooloose/syntastic'
"Plug 'ryanoasis/vim-devicons'
Plug 'neomake/neomake'
" Predawn 
Plug 'juanedi/predawn.vim'
" happy hacking color scheme
Plug 'YorickPeterse/happy_hacking.vim'
" wombat color theme
Plug 'sheerun/vim-wombat-scheme'
" Truecolor - color theme 
Plug 'rakr/vim-two-firewatch'
" Duotone for neovim
Plug 'atelierbram/Base2Tone-vim'
" emacs ported colorscheme
Plug 'mswift42/vim-themes'
call plug#end()

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Ctrl-n to toggle nerdtree
map <silent> <C-n> :NERDTreeToggle<CR>
" Ctrl-f to toggle fuzzysearch
map <silent> <C-f> :FZF<CR>
" Ctrl-p for next buffer
map <silent> <C-p> :bn<CR>
" Ctrl-o for the previous buffer
map <silent> <C-o> :bp<CR>
" Ctrl-k to kill the current buffer
map <silent> <C-k> :bw<CR>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

nmap <silent> <C-t> :TagbarToggle<CR>

map<silent> <C-u> :Econtroller<CR>
map<silent> <C-i> :Eview 
map<silent> <C-o> :Emodel<CR>

":bf            # Go to first file.
"":bl            # Go to last file
":bn            # Go to next file.
":bp            # Go to previous file.
":bw            # Close file.

"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'white', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'white', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"
" Setting tabs
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set noshowmode
set smarttab
set number

colorscheme seoul256
" colorscheme apprentice

set background=dark
" colorscheme two-firewatch
" colorscheme Base2Tone-Earth-dark
" firewatch settings 
let g:two_firewatch_italics=1
" au InsertLeave * colorscheme apprentice
" colorscheme hybrid_reverse
" au InsertEnter * colorscheme seoul256 
set laststatus=2
set ruler showcmd
set showtabline=2 
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename' ] ],
      \   'right': [ [ 'percent', 'lineinfo' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'separator': { 'left': '', 'right': '' }, 
      \ 'tabline' : {
        \ 'left': [ [ 'bufferinfo' ], [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
        \ 'right': [ [ 'close' ], ],
        \ },
    \ 'component_expand': {
        \ 'buffercurrent': 'lightline#buffer#buffercurrent2',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \ },
    \ 'componenty_type' : {
      \   'syntastic': 'error',
    \ },
    \ 'component_function': {
        \ 'fugitive': 'LightLineFugitive',
        \ 'gitgutter': 'LightLineGitGutter',
        \ 'readonly': 'LightLineReadonly',
        \ 'syntastic': 'SyntasticStatuslineFlag',
        \   'filename': 'LightLineFilename',
        \ 'bufferbefore': 'lightline#buffer#bufferbefore',
        \ 'bufferafter': 'lightline#buffer#bufferafter',
        \ 'bufferinfo': 'lightline#buffer#bufferinfo',
        \ }
      \ }

"      \ 'subseparator': { 'left': '', 'right': '' },
"      \ 'separator': { 'left': '', 'right': '' }, 
function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction



let g:lightline.enable = {
  \'statusline' : 1,
  \'tabline'    : 1
  \} 
function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" Devicons config for lightline 
function! MyFiletype()
  "return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  "return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" lightline-buffer settings
let g:lightline_buffer_logo = '☯ '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = ' '
let g:lightline_buffer_expand_right_icon = ' '
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = ' '

let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

"" if !exists('g:airline_symbols')
""    let g:airline_symbols = {}
""  endif

""  let g:airline_powerline_fonts = 1
  " the theme
""  let g:airline_theme = 'base16'

""  let g:airline#extensions#tabline#enabled = 1

  " unicode symbols
""  let g:airline_left_sep = '»'
""  let g:airline_left_sep = '▶'
""  let g:airline_right_sep = '«'
""  let g:airline_right_sep = '◀'
""  let g:airline_symbols.linenr = '␊'
""  let g:airline_symbols.linenr = '␤'
""  let g:airline_symbols.linenr = '¶'
""  let g:airline_symbols.branch = '⎇'
""  let g:airline_symbols.paste = 'ρ'
""  let g:airline_symbols.paste = 'Þ'
""  let g:airline_symbols.paste = '∥'
""  let g:airline_symbols.whitespace = 'Ξ'

"  autocmd VimEnter * NERDTree | wincmd p
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
" To ensure that this plugin works well with Tim Pope's fugitive, use the
" following patterns array:
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Enable bold font 
let g:enable_bold_font = 1
" vim-mundo settings file 
set undofile
set undodir=~/.vim/undo
let mapleader="\<SPACE>"

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.


" Relative numbering
function! NumberToggle()
	if(&relativenumber == 1)
  	set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>
nnoremap ; :
nnoremap Q @q  

" Configs 
"
" limelight
let g:limelight_default_coefficient = 0.3
let g:limelight_conceal_ctermfg = 'DarkGray'
let g:limelight_conceal_guifg =  '#777777'
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Key Mappings
"
" Mapping limelight to l
"nmap <Leader>l <Plug>(Limelight)
"xmap <Leader>l <Plug>(Limelight)
"
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
	  \	if &omnifunc == "" |
		\		setlocal omnifunc=syntaxcomplete#Complete |
		\	endif
endif

filetype plugin indent on " required
" end example Vundle install
" step 2: font configuration
" These are the basic settings to get the font to work (required):
"
" autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_ruby_enabled_makers = ['rubocop']

set clipboard+=unnamedplus
" The following became unnecessary
" " Copy to clipboard
"vnoremap  <leader>y  "+y
"nnoremap  <leader>Y  "+yg_
"nnoremap  <leader>y  "+y
"nnoremap  <leader>yy  "+yy

" " Paste from clipboard
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P
