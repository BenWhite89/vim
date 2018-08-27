set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
    source ~/.vim_runtime/my_configs.vim
catch
endtry

" plugins
execute pathogen#infect()

" set colors
set termguicolors

let g:nord_comment_brightness = 12
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_uniform_diff_background = 1

let g:gruvbox_hls_cursor = 'orange'
let g:gruvbox_improved_warnings = 1

colorscheme gruvbox

syntax on

" Ag settings
let g:ackprg = 'ag --nogroup --nocolor --column'

" CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" general settings
set tabstop=4                                   " spaces per TAB
set softtabstop=4                               " spaces per TAB when editing
set expandtab                                   " tabs are spaces
set number                                      " show line numbers
filetype indent on                              " load filetype-specific indent files
set wildmenu                                    " visual autocomplete for command menu
set showmatch                                   " highlight matching [{()}]
set incsearch                                   " search as characters are entered
set hlsearch                                    " highlight matches
set foldenable                                  " enable folding
set foldlevelstart=10                           " open most folds by default
set foldnestmax=10                              " nested fold max
set foldmethod=indent                           " fold based on indent level
set virtualedit+=onemore                        " $ sets cursor to true end of line
set number                                      " set hybrid line indeces
set relativenumber                              " set hybrid line indeces
set guifont=Monaco:h12                          " set font-size

let mapleader=","                               " leader is comma

" remappings

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
nnoremap <space> za

" move vertically by visual line
nnoremap j gj

" highlight last inserted text
nnoremap gV `[v`]

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp $~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" save sesion
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag

" config
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
