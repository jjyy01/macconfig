
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
set number
set ts=4
set expandtab
set cindent
set shiftwidth=4

inoremap <C-e> <END>
inoremap <C-a> <HOME>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <M-f> <S-Right>
inoremap <M-b> <S-Left>
inoremap jk <ESC>
let mapleader = ","


"vundle begin

set nocompatible " be iMproved,不要使用vi的键盘模式，而是vim自己的

filetype off " required!侦测文件类型 /** 从这行开始，vimrc配置 **/

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

"let Vundle manage Vundle

" required!

Bundle 'gmarik/vundle'

" My Bundles here: /* 插件配置格式 */

"

" original repos on github （Github网站上非vim-scripts仓库的插件，按下面格式填写）
Bundle 'tpope/vim-fugitive'

Bundle 'Lokaltog/vim-easymotion'

Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

Bundle 'tpope/vim-rails.git'

" vim-scripts repos （vim-scripts仓库里的，按下面格式填写）

Bundle 'L9'

Bundle 'FuzzyFinder'

" non github repos （非上面两种情况的，按下面格式填写）

Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on " required! /载入文件类型插件为特定文件类型载入相关缩进文件** vimrc文件配置结束 **/
" /** vundle命令 **/
"
" " Brief help
"
" " :BundleList - list configured bundles
"
" " :BundleInstall(!) - install(update) bundles
"
" " :BundleSearch(!) foo - search(or refresh cache first) for foo
"
" " :BundleClean(!) - confirm(or auto-approve) removal of unused bundles
"
" "
"
" " see :h vundle for more details or wiki for FAQ
"
" " NOTE: comments after Bundle command are not allowed..
"
"
"vundle end
