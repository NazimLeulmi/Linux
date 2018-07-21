" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'suan/vim-instant-markdown'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'flazz/vim-colorschemes'
Plugin 'bash-support.vim'
Plugin 'gertjanreynaert/cobalt2-vim-theme'
Plugin 'plasticboy/vim-markdown'
" All of your Plugins must be added before the following line
call vundle#end()            " required
set nocompatible
filetype plugin on    " required
syntax on


let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

let g:instant_markdown_autostart = 0
map <leader>md :InstantMarkdownPreview <CR>

set tabstop=3
set shiftwidth=3
set expandtab
set number
set relativenumber
color Monokai


