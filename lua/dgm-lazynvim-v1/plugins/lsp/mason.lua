return {
    {
        'williamboman/mason.nvim',
        config = function()
            local mason = require("mason")
             -- enable mason and configure icons
            mason.setup({
                ui = {
                  icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                  },
                },
            })
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
        },
        config = function()
            -- import mason-lspconfig
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup({
                ensure_installed = {
                    'gopls',
                    'pyright',
                    'lua_ls',
                    'jsonls',
                    'yamlls',
                    'rust_analyzer',
                },
            })
        end,
    },
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        config = function()
            local mason_tool_installer = require("mason-tool-installer")
            mason_tool_installer.setup({
                ensure_installed = {
                    "prettier", -- prettier formatter
                    "stylua", -- lua formatter
                    "isort", -- python formatter
                    "black", -- python formatter
                    "debugpy", -- python debugger
                    "pylint", -- python linter
                    "eslint_d", -- js linter
                    "golangci-lint", -- go linter
                },
            })
        end,
    },
}
