" dein configurations.

let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1
let g:dein#notification_icon = '$XDG_CONFIG_HOME/nvim/signs/warn.png'
let g:dein#install_log_filename = '~/dein.log'

let s:path = expand('$XDG_CONFIG_HOME/nvim/dein')
if !dein#load_state(s:path)
  finish
endif

call dein#begin(s:path, expand('<sfile>'))

call dein#load_toml('$XDG_CONFIG_HOME/nvim/rc/dein.toml', {'lazy': 0})
call dein#local('/usr/local/Cellar/global/6.6.1/share/gtags', {})
call dein#load_toml('$XDG_CONFIG_HOME/nvim/rc/deinlazy.toml', {'lazy' : 1})
if has('nvim')
  call dein#load_toml('$XDG_CONFIG_HOME/nvim/rc/deineo.toml', {})
endif
call dein#load_toml('$XDG_CONFIG_HOME/nvim/rc/deinft.toml')

let s:vimrc_local = findfile('vimrc_local.vim', '.;')
if s:vimrc_local !=# ''
  " Load develop version plugins.
  call dein#local(fnamemodify(s:vimrc_local, ':h'),
        \ {'frozen': 1, 'merged': 0},
        \ ['vim*', 'unite-*', 'neco-*', '*.vim', 'denite.nvim'])
  if has('nvim')
    call dein#local(fnamemodify(s:vimrc_local, ':h'),
          \ {'frozen': 1, 'merged': 0},
          \ ['deoplete-*', '*.nvim'])
  endif
endif

if dein#tap('deoplete.nvim') && has('nvim')
  call dein#disable('neocomplete.vim')
endif
call dein#disable('neobundle.vim')
call dein#disable('neopairs.vim')

call dein#end()
call dein#save_state()

" if !has('vim_starting') && dein#check_install()
if dein#check_install()
  " Installation check.
  call dein#install()
endif
