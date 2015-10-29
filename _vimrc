set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Personal settings
set number
set lines=60 columns=200
set guifont=Consolas:h13
filetype on
autocmd FileType c set ts=3 sw=3 sts=3
autocmd FileType cpp set ts=3 sw=3 sts=3
autocmd FileType python set ts=3 sw=3 sts=3

set background=light
set autoindent
set autoread
set backspace=2
set backupcopy=yes
set clipboard=unnamed
set encoding=utf-8
set expandtab
set list
set listchars=tab:>\ ,trail:=
set colorcolumn=81
set nobackup
set nowritebackup

" Vundle settings
set rtp+=C:/apps/vim/vimfiles/bundle/Vundle.vim/
set rtp+=C:/apps/vim/vimfiles/bundle/vim-colors-solarized/
let path='C:/apps/vim/vimfiles/bundle'
call vundle#begin(path)
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'davidhalter/jedi-vim'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on
colorscheme solarized

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
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

