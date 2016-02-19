
if has('nvim')
    let g:editor_root=expand("~/.nvim")
else
    let g:editor_root=expand("~/.vim")
endif

scriptencoding utf-8
set encoding=utf-8

set nocp
source ~/vundle.vimrc
"source ~/pymode_web2py.vimrc

"misc
"{
  " autowrite on exit
  set autowrite

  let g:ycm_confirm_extra_conf = 0
  "let g:ycm_filetype_specific_completion_to_disable = {python}
  set noswapfile
  set nobackup

  set backspace=indent,eol,start
  set mouse=
"}

"filetype stuffs
"{
  filetype plugin on
  filetype indent on
  au BufNewFile,BufRead Tupfile,*.tup set filetype=tup
  au BufNewFile,BufRead *.conf set filetype=cfg
"}

"coloring, nicelooking stuffs
"{
  set t_Co=16
  syntax on
  set bg=dark
  colorscheme pablo

  " numbering
  set nu

  " incremental search
  set incsearch

  " highlightsearch
  set hlsearch

  " set stl always visible
  set laststatus=2
  set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=0x\%04B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

  " hold 'x' line if scrolling
  set scrolloff=8

  " show selected area in any kind of VISUAL mode
  set showcmd
  set showmatch

  set wildmenu
  set wildmode=longest:full,full
  "set cursorline

  set shortmess=atI
  set title

  set wildignore=+*.o,*.d,*.gcda,*.gcno,*.so,*.pyc,__pycache__
  set colorcolumn=120

  set cmdheight=2
"}

"highlights,matches
"{
  hi TabLine ctermfg=0 ctermbg=7

  highlight CursorLine term=none cterm=none ctermbg=0
  highlight CursorLineNr cterm=none ctermbg=4

  highlight ExtraWhitespace ctermbg=9 guibg=red
  match ExtraWhitespace /\s\+$/

  " highlight method names (does not work with 256 colored setting)
  function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
  endfunction

  autocmd Syntax cpp call EnhanceCppSyntax()

  function! HighlightDoubleQuotes()
      syn region pyDoubleQuotes start=/\v"/ skip=/\v\\./ end=/\v"/
      hi def link pyDoubleQuotes Error
  endfunction

  autocmd Syntax python call HighlightDoubleQuotes()

  " allow recursive search
  "set path=.,/usr/include,,**
"}

"key mappings
"{
  set pastetoggle=<F3>
  "let mapleader = ','

  " run current file
  map<F5> :!./%<CR>

  nnoremap <silent> <F9> :set nonumber!<CR>

  " switch tabs left and right
  map <silent> <C-H> :tabp<CR>
  map <silent> <C-L> :tabn<CR>

  imap <silent> <C-H> <Esc>:tabp<CR>I
  imap <silent> <C-L> <Esc>:tabn<CR>I

  nmap <silent> <leader>n :nohls<CR>

  " remove trailing whitespace
  nmap <silent> <leader><space> :%s/\s\+$//<CR>

  let NERDTreeIgnore=['\~$', '.o$']
  let g:nerdtree_tabs_open_on_console_startup = 1
  let g:nerdtree_tabs_synchronize_view = 1
  nmap <silent> <leader>d :NERDTreeToggle<CR>
  nmap <silent> <leader>f :NERDTreeFind<CR>

  nmap <silent> <leader>gn :GitGutterNextHunk<CR>
  nmap <silent> <leader>gp :GitGutterPrevHunk<CR>
  nmap <silent> <leader>gg :GitGutterToggle<CR>

  " jump-to-def
  nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

  " fix pgup/pgdown to step back the same position
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>

  " copy between vim instances on the same server
  vmap <silent> <leader>y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/vim-reg.txt<CR>
  nmap <silent> <leader>y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/vim-reg.txt<CR>
  map <silent> <leader>p :sview ~/vim-reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
  map <silent> <leader>P :sview ~/vim-reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

"}

"tabbing options
"{
  " do not insert tab, only spaces
  " coding convention: indent is 2
  "set tabstop=2
  set sts=4
  set sw=4
  "set shiftwidth=2
  set expandtab
  set autoindent

  " tabbing settings
  set showtabline=2
  set tabpagemax=15

  set smarttab
  set smartindent

"}

"special ettings
"{
  set comments=s1:/*,mb:*,ex:*/,:// formatoptions=croql cindent
  " for c++, perl we need the crazy space/tab style
  " pyccuracy *.acc files are cucumber in vim sense
  autocmd BufRead,BufNewFile *.acc set filetype=cucumber
  autocmd BufRead,BufNewFile *.feature set expandtab sw=2 ts=2
  autocmd BufRead,BufNewFile *.js set expandtab sw=4 ts=4
  "autocmd BufRead,BufNewFile *.sh set sw=4 ts=8 noexpandtab
  set textwidth=120
  set list
  set listchars=tab:>\ ,trail:$
"}


