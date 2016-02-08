" Basic options.
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on
syntax on
colorscheme jellybeans
set cursorline     " Makes it easy to spot cursor.
set hidden         " Allow switching from buffers that have unsaved modifications.
set incsearch      " Jump to search results incrementally.
set mouse=a        " Enable basic mouse support.
set nohlsearch     " Don't highlight search results.
set number         " Show line numbers on the left.
set t_ut=          " Fixes background color issues when running inside tmux.
set title          " Add a title showing we're in Vim in terminal.
set wildignorecase " Ignore case when completing file names and directories.

" Indentation options.
set backspace=indent,eol,start
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1

" Enable persistent undo.
set undodir=~/.vim/undo
set undofile

set directory=~/.vim/swap

set wig+=*.py[cod]
set wig+=*.o
set wig+=*.a
set wig+=*.so
set wig+=*/deps/*
set wig+=*/node_modules/*
set wig+=*/target/*

" Mappings.
noremap ; :
noremap <C-c> <Esc>

inoremap <Tab> <C-r>=InsertTabWrapper()<CR>

nnoremap <C-e> :buffer#<CR>
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-x> :bdelete<CR>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <Leader>n :call RenameFile()<CR>

let g:ctrlp_map = '<Leader>t'
let g:go_fmt_command = "goimports"

" File type specific options.
au FileType c setl ts=4 sw=4 noet
au FileType coffee setl ts=2 sw=2 et
au FileType eruby setl ts=2 sw=2 et
au FileType gitconfig setl ts=2 sw=2 noet
au FileType go setl ts=4 sw=4 noet
au FileType haskell setl ts=4 sw=4 et
au FileType html setl ts=2 sw=2 et
au FileType javascript setl ts=2 sw=2 et
au FileType python setl ts=4 sw=4 et
au FileType ruby setl ts=2 sw=2 et
au FileType scss setl ts=2 sw=2 et
au FileType vim setl ts=2 sw=2 et

au FileType gitcommit setl spell
au FileType go nmap <Leader>d <Plug>(go-def)

" Status line and helper functions below from Gary Bernhardt's .vimrc
" https://github.com/garybernhardt/dotfiles/blob/master/.vimrc
set laststatus=2
set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)

" Prompt to rename the current file.
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

" Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction
