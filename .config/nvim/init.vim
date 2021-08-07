call pathogen#infect()
filetype plugin indent on

" Configuration file for vim
set modelines=0		" CVE-2007-2438
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing
set nu
set hlsearch
syn on
set incsearch
set updatetime=100
colorscheme gruvbox
set bg=dark
set noshowmode " because of lightline
set mouse=a

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" set leader for nerdcommander # ,cc & ,cu
let mapleader = ','

" NerdTree Toggle Strg + n
nmap <C-n> :NERDTreeToggle<CR>

" Show Dotfiles
let NERDTreeShowHidden=1

" show branchname in lightline
let g:lightline = {
\    'colorscheme': 'gruvbox',
\    'active': {
\        'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filenameOrLastFolderOfIndex', 'modified' ] ]
\    },
\    'component_function': {
\        'gitbranch': 'fugitive#head',
\        'filenameOrLastFolderOfIndex': 'LightLineFixIndexFiles'
\    },
\}
function! LightLineFixIndexFiles()
    let filenameonly = expand('%:t:r')
    if filenameonly ==? "index"
        return remove(split(expand("%:h"), "/"), -1) . "/" . expand("%:t")
    else 
        return expand("%:p")
    endif
endfunction
