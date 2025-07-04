return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      {
        "saghen/blink.compat",
        version = "2.*",
        lazy = true,
        opts = {},
        optional = false,
      },
      { "rafamadriz/friendly-snippets" },
      { "dmitmel/cmp-digraphs" },
      { "jdrupal-dev/css-vars.nvim", opts = {} },
      { "nvim-tree/nvim-web-devicons", opts = {} },
      { "onsails/lspkind.nvim", opts = {} },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "cmdline", "complete_func", "digraphs" },
      providers = {
        digraphs = {
          name = "digraphs",
          module = "blink.compat.source",
          score_offset = -3,
          opts = {
            cache_digraphs_on_start = true,
          },
        },
        cmdline = {
          min_keyword_length = function(ctx)
            -- when typing a command, only show when the keyword is 3 characters or longer
            if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
              return 3
            end
            return 0
          end,
        },
      },
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      prebuilt_binaries = {
        download = true,
        ignore_version_mismatch = false,
        force_version = nil,
      },
    },
    term = {
      enabled = true,
      keymap = { preset = "inherit" },
      sources = {},
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = nil,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
        menu = { auto_show = true },
        ghost_text = { enabled = true },
      },
    },
    cmdline = {
      enabled = true,
      keymap = { preset = "cmdline" },
      sources = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        if type == ":" or type == "@" then
          return { "cmdline" }
        end
        return {}
      end,
      completion = {
        trigger = {
          show_on_blocked_trigger_characters = {},
          show_on_x_blocked_trigger_characters = {},
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = true,
          },
        },
        menu = { auto_show = true },
        ghost_text = { enabled = true },
      },
    },
    opts = {
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
        ghost_text = {
          enabled = true,
          show_with_selection = true,
          show_without_selection = true,
          show_with_menu = true,
          show_without_menu = true,
        },
        menu = {
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      icon = dev_icon
                    end
                  else
                    icon = require("lspkind").symbolic(ctx.kind, {
                      mode = "symbol",
                    })
                  end

                  return icon .. ctx.icon_gap
                end,

                highlight = function(ctx)
                  local hl = "BlinkCmpKind" .. ctx.kind
                    or require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx)
                  if vim.tbl_contains({ "Path" }, ctx.source_name) then
                    local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                    if dev_icon then
                      hl = dev_hl
                    end
                  end
                  return hl
                end,
              },
            },
          },
        },
      },
    },
  },
}
