return {
  "mfussenegger/nvim-dap",
  lazy = true,

  dependencies = {

    -- fancy UI for the debugger
    {
      "rcarriga/nvim-dap-ui",
      "ldelossa/nvim-dap-projects",
    },

    -- virtual text for the debugger
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },

    -- which key integration
    {
      "folke/which-key.nvim",
      optional = true,
      opts = {
        defaults = {
          ["<leader>d"] = { name = "+debug" },
        },
      },
    },

    -- mason.nvim integration
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = "mason.nvim",
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        -- You'll need to check that you have the required things installed
        -- online, please don't ask me how to install them :)
        ensure_installed = {
          -- Update this to ensure that you have the debuggers for the langs you want
          "go",
        },
      },
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    require("nvim-dap-projects").search_project_config()
    vim.fn.sign_define('DapBreakpoint',{ text ='🧘', texthl ='', linehl ='', numhl =''})
    vim.fn.sign_define('DapStopped',{ text ='🏃', texthl ='', linehl ='', numhl =''})


    local dap = require('dap')
    dap.adapters.delve = {
      type = 'server',
      port = '${port}',
      executable = {
        command = 'dlv',
        args = {'dap', '-l', '127.0.0.1:${port}'},
      }
    }


    -- create a file called .nvim-day.lua in your project directory with the followin information
    -- local dap = require("dap")
    --
    -- dap.adapters.lldb = {
    --     type = "executable",
    --     command = "/usr/local/opt/llvm/bin/lldb-vscode", <-- codelldb does not stop at breakpoints on osx (20-nov-23) so use llvm/lldb-vscode
    -- }
    --
    -- dap.configurations.rust = {
    --   {
    --     name = "Debug Echosplitter-rs",
    --     type = "lldb",
    --     request = "launch",
    --     program = function()
    --       return "<insert path to project executable here>"
    --     end,
    --     cwd = "<insert path to project directory here",
    --     stopOnEntry = false,
    --   },
    -- }
    --
  end,
}

