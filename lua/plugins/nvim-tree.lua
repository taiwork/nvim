return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      -- recommended settings from nvim-tree documentation
      vim.g.loaded = 1
      vim.g.loaded_netrwPlugin = 1

      -- Change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      -- nvim-tree setup
      require("nvim-tree").setup({
        view = {
          width = 40,
        },
        renderer = {
          indent_width = 1,
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- Arrow when folder is closed
                arrow_open = "", -- Arrow when folder is open
              },
            },
          },
        },
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        git = {
          enable = false,
        },
      })

      -- for auto-session workarounds
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = "NvimTree*",
        callback = function()
          local api = require("nvim-tree.api")
          local view = require("nvim-tree.view")

          if not view.is_visible() then
            api.tree.open()
          end
        end,
      })
    end,
  },
}
