	

" Title:        nvim-batman
" Description:  A fancy sleep screen for neovim.
" Last Change:  12/28/2022
" Maintainer:   yunusey <https://github.com/yunusey>

if exists("g:loaded_nvimbatman")
    finish
endif
let g:loaded_nvimbatman = 1

let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/nvim-batman/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 Sleep lua require("nvim-batman").sleep()
