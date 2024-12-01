local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- オートフォーマット用のオートコマンドグループ
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- null_ls.setup({
--   sources = {
--     formatting.prettier, -- JavaScript/TypeScript フォーマッター
--     formatting.stylua, -- Lua フォーマッター
--     diagnostics.eslint_d.with({
--       condition = function(utils)
--         return utils.root_has_file(".eslintrc.js")
--       end,
--     }), -- JavaScript/TypeScript リンター
--   },
--   on_attach = function(client, bufnr)
--     if client.supports_method("textDocument/formatting") then
--       vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--       vim.api.nvim_create_autocmd("BufWritePre", {
--         group = augroup,
--         buffer = bufnr,
--         callback = function()
--           vim.lsp.buf.format({
--             filter = function(cl)
--               return cl.name == "null-ls"
--             end,
--             bufnr = bufnr,
--           })
--         end,
--       })
--     end
--   end,
-- })
