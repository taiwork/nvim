local lspkind = require("lspkind")

lspkind.init({
  mode = 'symbol',
  preset = 'default',
  symbol_map = {
    Copilot = "",
    -- 他のシンボルも必要に応じて追加
  },
})
