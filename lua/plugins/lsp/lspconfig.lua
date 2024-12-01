-- 安全にモジュールをインポート
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- Keymap のための設定
local keymap = vim.keymap

-- on_attach 関数の定義
local on_attach = function(client, bufnr)
  -- キーバインドのオプション
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Lspsaga キーバインド
  keymap.set("n", "gt", "<cmd>Lspsaga finder<CR>", opts)
  keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

  -- TypeScript 特有のキーマップ
  if client.name == "tsserver" then
    keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>", opts)
    keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>", opts)
    keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>", opts)
  end
end

-- 自動補完のための capabilities 設定
local capabilities = cmp_nvim_lsp.default_capabilities()

-- サーバーごとの設定
local servers = {
  tsserver = {},
  cssls = {},
  tailwindcss = {},
  emmet_ls = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  },
  solargraph = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", {
    on_attach = on_attach,
    capabilities = capabilities,
  }, config))
end
