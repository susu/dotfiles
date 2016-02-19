filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin(g:editor_root . '/bundle')

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" original repos on github

Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" Plugin 'vim-scripts/Cpp11-Syntax-Support'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
" mercurial plugin:
" Plugin 'phleet/vim-mercenary'
" Plugin 'vim-scripts/vcscommand.vim'
Plugin 'tpope/vim-cucumber'
Plugin 'mileszs/ack.vim'
Plugin 'klen/python-mode'
Plugin 'Shutnik/jshint2.vim'
" Plugin 'hdima/python-syntax'
Plugin 'othree/yajs.vim'
Plugin 'tmhedberg/matchit'
Plugin 'rust-lang/rust.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'powerline/powerline'
Plugin 'ctrlpvim/ctrlp.vim'



if has('nvim')
    Plugin 'bfredl/nvim-ipy'
endif

call vundle#end()            " required
filetype plugin indent on    " required

" -------- Settings for plugins --------

"vim-gitgutter
"{
"  let g:gitgutter_highlight_lines = 1
"}

let g:ycm_filetype_blacklist = {'python': 1}

"syntastic
"{
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['python'] }
    let g:syntastic_javascript_checkers = ['jscs']
    " turn off folding:
    let g:pymode_folding = 0
    " auto-virtualenv detection:
    let g:pymode_virtualenv = 1
    let g:pymode_options_max_line_length = 120

    " Ignored error codes:
    let g:pymode_lint_ignore=["E402", "W0401", "W0404"]

    " run pymode on filewrite:
    let g:pymode_lint_write = 1

    "let g:pymode_rope_lookup_project = 0
    "let g:pymode_rope = 1
"}

"ctrlp
"{
    let g:ctrlp_max_files = 0
"}

"powerline
"{
    let g:Powerline_symbols = 'fancy'
"}
