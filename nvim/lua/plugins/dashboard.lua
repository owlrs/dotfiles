local logo = [[
             ██████╗ ██╗    ██╗██╗     ███╗   ███╗ █████╗ ████████╗███████╗          Z
            ██╔═████╗██║    ██║██║     ████╗ ████║██╔══██╗╚══██╔══╝██╔════╝      Z    
            ██║██╔██║██║ █╗ ██║██║     ██╔████╔██║███████║   ██║   █████╗     z       
            ████╔╝██║██║███╗██║██║     ██║╚██╔╝██║██╔══██║   ██║   ██╔══╝   z         
            ╚██████╔╝╚███╔███╔╝███████╗██║ ╚═╝ ██║██║  ██║   ██║   ███████╗           
             ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝           
]]

logo = string.rep("\n", 4) .. logo .. "\n\n"

return {
  { "folke/snacks.nvim", opts = { dashboard = { enabled = false } } },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.stdpath("state") .. "/my-sessions/",
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").save()
        end,
        desc = "Save session",
      },
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "Restore last session",
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
        desc = "Select session to restore",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "Stop persistence",
      },
    },
  },
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = function()
      local opts = {
        theme = "hyper",
        config = {
          packages = { enable = true },
          header = vim.split(logo, "\n"),
          shortcut = {
            { icon = "󰊳 ", desc = "Update", group = "@property", action = "Lazy update", key = "u" },
            {
              icon = " ",
              icon_hl = "@variable",
              desc = "Yazi",
              group = "Label",
              action = "Yazi",
              key = "f",
            },
            {
              icon = " ",
              desc = "Config",
              group = "Number",
              action = function()
                require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
              end,
              key = "c",
            },
            {
              icon = " ",
              desc = "Restore Session",
              group = "Number",
              action = function()
                require("persistence").load()
              end,
              key = "s",
            },
            {
              icon = " ",
              desc = "Projects",
              group = "Number",
              action = "FzfLua files cwd=~/The0wlport/Projects/",
              key = "p",
            },
            { icon = "󰒲 ", desc = "Lazy", group = "Number", action = "Lazy", key = "l" },
            { icon = " ", desc = "Quit", group = "Number", action = "qa", key = "q" },
          },
          footer = function()
            return { "" }
          end,
          project = { enable = true, limit = 8, action = "FzfLua files cwd=" },
          mru = { limit = 5, cwd_only = false },
        },
      }

      if vim.bo.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              -- vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
              vim.cmd("silent doautocmd UIEnter")
            end)
          end,
        })
      end

      vim.keymap.set("n", "<leader>;", function()
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[bufnr].buftype ~= "terminal" then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end
        vim.cmd("Dashboard")
      end, { desc = "Open Dashboard", noremap = true })

      return opts
    end,
  },
}
