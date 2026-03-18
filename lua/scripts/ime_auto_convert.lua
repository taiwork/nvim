-- lua/scripts/ime_auto_convert.lua
local M = {}

function M.setup()
  local zenhan_path = "/mnt/c/tools/zenhan/bin64/zenhan.exe"

  -- 2. インサートモードを抜けた時にIMEをオフにする (InsertLeave)
  vim.api.nvim_create_autocmd("InsertLeave", {
    group = vim.api.nvim_create_augroup("ImeOffGroup", { clear = true }),
    pattern = "*",
    callback = function()
      vim.fn.system(zenhan_path .. " 0")
    end,
  })
end

return M
