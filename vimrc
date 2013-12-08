"""" Rick Button's .vimrc

"""" VUNDLE SETUP """"

set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


"""" BUNDLE LIST  """"
Bundle 'vim-scripts/xoria256.vim'
Bundle 'SuperTab'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'Raimondi/delimitMate'
Bundle 'jnwhiteh/vim-golang'
Bundle 'Valloric/YouCompleteMe'
Bundle 'AfterColors.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mhinz/vim-signify'
Bundle 'embear/vim-localvimrc'
Bundle 'SirVer/ultisnips'

"""" COLOR SCHEME """"
set t_Co=256
colorscheme xoria256

"""" CUSTOM SETTINGS """"
set nu
set bs=indent,eol,start     " Backspace over everything in insert mode
syntax on
set exrc                    " enable per-directory .vimrc files
set secure                  " disable unsafe commands in local .vimrc files
set tabstop=2               " tabstop and shiftwidth, indenting
set shiftwidth=2
set expandtab
filetype plugin indent on
set laststatus=2
set completeopt=menu
set cursorline
"""" folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

set grepprg=zsh\ -c\ 'grep\ -nH\ $*'

if filereadable(glob("~/.vimrc.local")) 
    source ~/.vimrc.local
endif


"""" Go setup """"
au BufRead,BufNewFile *.go set filetype=go
set rtp+=$GOROOT/misc/vim

"""" FILE TYPE SETUP """"
autocmd FileType make setlocal noexpandtab

"""" DISABLE ARROW KEYS """"
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

"""" WINDOW MOVEMENT MAPPING """"
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
"""" TagBar SETUP """"
nnoremap <F3> :TagbarToggle<CR>

"""" CtrlP SETUP """"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"""" NERDTree SETUP """"
map <F2> :NERDTreeToggle<CR>

"""" delimitMate SETUP """"
let g:delimitMate_expand_cr = 1

"""" YCM SETUP """"
let g:ycm_confirm_extra_conf = 0

"""" ECLIM SETUP """"
let g:EclimCompletionMethod = 'omnifunc'

"""" LOCAL vimrc SETUP """"
let g:localvimrc_ask = 0

"""" vim-signify SETUP """"
let g:signify_sign_overwrite = 0
