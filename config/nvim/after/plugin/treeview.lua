local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

-- pass to setup along with your other options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  -- change folder arrow icons
    icons = {
        glyphs = {
            folder = {
                arrow_closed = "+", -- arrow when folder is closed
                arrow_open = "-", -- arrow when folder is open
            },
        },
    },
  },
  -- do not filter .dot files
  filters = {
    dotfiles = false,
  },
  -- do not filter git
  git = {
    ignore = false,
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
  on_attach = my_on_attach,
})
