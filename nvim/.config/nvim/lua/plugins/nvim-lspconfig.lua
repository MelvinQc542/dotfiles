return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({})

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

    require'lspconfig'.lua_ls.setup {
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT' -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME -- Make the server aware of Neovim runtime files
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    }
  end,
}
