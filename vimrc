set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"========================
"Initial Plugin
"========================
" 修改leader键
let mapleader = ','
let g:mapleader = ','
syntax on

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


filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set guifont=DejaVu\ Sans\ Mono:h10:cDEFAULT
colorscheme monokai

set t_Co=256
set lines=45 columns=150
set number
set nowrap
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent

