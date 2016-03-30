set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin


"========================
"Initial Plugin
"========================
" 修改leader键 let mapleader = ',' default '\'
let g:mapleader = ','
syntax on

" 替换 Esc
inoremap <C-L> <Esc>

set encoding=utf-8
set fileencoding=utf-8

if filereadable(expand("~/vimfiles/vimrc.bundles"))
    source ~/vimfiles/vimrc.bundles
endif


"create undo file
if has('persistent_undo')
  set undolevels=1000         " How many undos
  set undoreload=10000        " number of lines to save for undo
  set undofile                " So is persistent undo ...
  set undodir=$APPDATA\vim\undo\
endif
set backupdir=$APPDATA\vim\backup\
set directory=$APPDATA\vim\swap\

" 关闭交换文件
set noswapfile

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set guifont=DejaVu\ Sans\ Mono:h10:cDEFAULT

set t_Co=256
set background=dark
colorscheme solarized
" 开始窗口大小
set lines=45 columns=150
set number
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent

"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>

"noremap <leader>1 1gt
"noremap <leader>2 2gt
"noremap <leader>3 3gt
"noremap <leader>4 4gt
"noremap <leader>5 5gt
"noremap <leader>6 6gt
"noremap <leader>7 7gt
"noremap <leader>8 8gt
"noremap <leader>9 9gt
"noremap <leader>0 :tablast<cr>

set completeopt=menu,menuone
"hi Pmenu                    guibg=#606060
"hi PmenuSel                 guifg=#dddd00 guibg=#1f82cd
"hi PmenuSbar                guibg=#d6d6d6
"hi PmenuThumb               guifg=#3cac3c
set pumheight=20


set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" list buffers
nnoremap <leader>l :buffers<CR>:buffer<Space>

" 自定义文件语法
au BufReadPost *.part set syntax=html

set scrolloff=7
set laststatus=2

set cursorline

autocmd! bufwritepost vimrc source %
autocmd! bufwritepost vimrc.bundles source ~\vimfiles\vimrc
