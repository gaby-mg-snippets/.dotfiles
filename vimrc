" My personal vimrc file
"
" Maintainer:	Gaby Molina Goigoux <gabymg@gabymg.es>
" Last change:	2024 Aug 27
"
" This file is based on the original vimrc example provided by Bram Moolenaar.
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc
"
" This vimrc file is part of my .dotfiles repository on GitHub.
" Repository: https://github.com/gaby-mg-snippets/tars-.dotfiles

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

set modeline

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Automatically update the Last change date in this vimrc file
autocmd BufWritePre ~/.vimrc call UpdateLastChangeLine()

function! UpdateLastChangeLine()
    let l:line_number = search('^" Last change: ')
    if l:line_number > 0
        execute l:line_number . 's#^" Last change:.*#" Last change:  ' . strftime("%Y %b %d")#'
    endif
endfunction
