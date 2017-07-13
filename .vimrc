set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" My Bundles:
"
" original repos on github

" syntax compleation
Plugin 'Valloric/YouCompleteMe'

" dark themes
Plugin 'scwood/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'

" webdev syntax highlighting meta package
Plugin 'sheerun/vim-polyglot'

" GIT integration
Plugin 'tpope/vim-fugitive'

" Close any open tag
Plugin 'alvan/vim-closetag'

" TT2 and Perl 
Plugin 'vim-perl/vim-perl'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" tab width of 4 and indent of 4
" " indent levels end up going in as literal tabs in the file
:set shiftwidth=2
:set tabstop=2
:set noexpandtab
:set softtabstop=0

:set wildmenu
:set wildmode=full

" colour scheme settings
syntax on
set background=dark
set t_Co=256
colorscheme hybrid

" set stach as mustache
au BufRead,BufNewFile *.stache setfiletype mustache
au BufRead,BufNewFile *.component setfiletype html
