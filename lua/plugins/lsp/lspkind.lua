local lspkind = require("lspkind")

lspkind.init({
  mode = 'symbol',
  preset = 'default',
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    -- 他のシンボルも必要に応じて追加
  },
})
