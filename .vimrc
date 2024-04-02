let $KEYMAPS='~/.vim/keymaps.vim'
let $PLUGINS='~/.vim/plugins.vim'
let $BASE='~/.vim/base.vim'

source $KEYMAPS
source $PLUGINS
source $BASE

au FileType toml call dein#toml#syntax()

