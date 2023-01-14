vim.cmd [[
try
  colorscheme nightfox
  hi normal guibg=NONE
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
