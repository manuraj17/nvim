
let g:python_host_prog='/usr/bin/python2'

call plug#begin('~/.config/nvim/plugged')  
" Make sure you use single quotes
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jistr/vim-nerdtree-tabs'
""Plug 'vim-airline/vim-airline'
""Plug 'vim-airline/vim-airline-themes'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/AutoClose'
Plug 'itchyny/lightline.vim'
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

call plug#end()

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-f> :FZF<CR>
map <silent> <C-p> :bn<CR>
map <silent> <C-o> :bp<CR>
map <silent> <C-k> :bw<CR>
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
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set noshowmode
set number
colorscheme seoul256

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

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
