set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'Gist.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


" 行番号の表示
set number
" 色付け
syntax on
" タブをスペース4つ分の大きさにする
set tabstop=2
set shiftwidth=2
" インデントを自動で合わせてくれる
set autoindent
" タブをスペースとして扱う
"set expandtab
" ~.swpファイルを作らない
set noswapfile
