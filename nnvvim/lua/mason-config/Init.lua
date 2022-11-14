local status_ok, mason = pcall(require, "mason")
if not status_ok then
  print("Problems with MASON-CONFIG")
end
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "bashls", "vimls", "pyright" },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>le", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>lq", vim.diagnostic.setloclist, opts)

vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local basics = require("lsp_basics")
  basics.make_lsp_commands(client, bufnr)
  basics.make_lsp_mappings(client, bufnr)
  -- client.server_capabilities.document_formatting = true
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  -- if client.config.flags then
  -- client.config.flags.allow_incremental_sync = true
end

local util = require("vim.lsp.util")

local formatting_callback = function(client, bufnr)
  vim.keymap.set("n", "<leader>w", function()
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr })
end
-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
vim.keymap.set("n", "<space>lw", vim.lsp.buf.add_workspace_folder, opts)
vim.keymap.set("n", "<space>lW", vim.lsp.buf.remove_workspace_folder, opts)
vim.keymap.set("n", "<space>ll", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, opts)
-- vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
vim.keymap.set("n", "<space>lR", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<space>la", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<space>lF", vim.lsp.buf.formatting, opts)

require("lspconfig")["pyright"].setup({
  on_attach = on_attach,
  formatting_callback = formatting_callback,
  -- flags = lsp_flags,
})
require("lspconfig")["tsserver"].setup({
  on_attach = on_attach,
  formatting_callback = formatting_callback,
  -- format = {
  -- 	enable = false,
  -- },
  -- flags = lsp_flags,
})
require("lspconfig")["rust_analyzer"].setup({
  on_attach = on_attach,
  formatting_callback = formatting_callback,
  -- flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {},
  },
})
require("lspconfig").sumneko_lua.setup({
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },

    formatting_callback = formatting_callback,
    -- on_attach = on_attach,
  },
})

require("lspconfig").bashls.setup({ on_attach = on_attach, formatting_callback = formatting_callback })
-- require("lspconfig").selene.setup({ on_attach = on_attach, formatting_callback = formatting_callback })
require("lspconfig").eslint.setup({ on_attach = on_attach, formatting_callback = formatting_callback })
-- require("lspconfig").tsserver.setup({ on_attach = on_attach,})
-- require("lspconfig").pyright.setup({ on_attach = on_attach,})
require("lspconfig").vimls.setup({ on_attach = on_attach, formatting_callback = formatting_callback })

mason.setup({
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",

    icons = {
      -- The list icon to use for installed packages.
      package_installed = "◍",
      -- The list icon to use for packages that are installing, or queued for installation.
      package_pending = "◍",
      -- The list icon to use for packages that are not installed.
      package_uninstalled = "◍",
    },

    keymaps = {
      -- Keymap to expand a package
      toggle_package_expand = "<CR>",
      -- Keymap to install the package under the current cursor position
      install_package = "i",
      -- Keymap to reinstall/update the package under the current cursor position
      update_package = "u",
      -- Keymap to check for new version for the package under the current cursor position
      check_package_version = "c",
      -- Keymap to update all installed packages
      update_all_packages = "U",
      -- Keymap to check which installed packages are outdated
      check_outdated_packages = "C",
      -- Keymap to uninstall a package
      uninstall_package = "X",
      -- Keymap to cancel a package installation
      cancel_installation = "<C-c>",
      -- Keymap to apply language filter
      apply_language_filter = "<C-f>",
    },
  },

  -- The directory in which to install packages.
  -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },

  pip = {
    -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
    -- and is not recommended.
    --
    -- Example: { "--proxy", "https://proxyserver" }
    install_args = {},
  },

  -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
  -- debugging issues with package installations.
  log_level = vim.log.levels.INFO,

  -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
  -- packages that are requested to be installed will be put in a queue.
  max_concurrent_installers = 4,

  github = {
    -- The template URL to use when downloading assets from GitHub.
    -- The placeholders are the following (in order):
    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
    -- 2. The release version (e.g. "v0.3.0")
    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
    download_url_template = "https://github.com/%s/releases/download/%s/%s",
  },
})
