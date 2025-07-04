return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    opts = {
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = { italic = true, bold = true },
      statementStyle = { italic = true, bold = true },
      keywordsStyle = { italic = true },
      typeStyle = { italic = true },
      terminalColors = true,
      dimInactive = false,
      transparent = true,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Transparent background
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

          -- SnacksDashboard
          SnacksDashboardHeader = { fg = theme.vcs.removed },
          SnacksDashboardFooter = { fg = theme.syn.comment },
          SnacksDashboardDesc = { fg = theme.syn.identifier },
          SnacksDashboardIcon = { fg = theme.ui.special },
          SnacksDashboardKey = { fg = theme.syn.special1 },
          SnacksDashboardSpecial = { fg = theme.syn.comment },
          SnacksDashboardDir = { fg = theme.syn.identifier },
          -- SnacksNotifier
          SnacksNotifierBorderError = { link = "DiagnosticError" },
          SnacksNotifierBorderWarn = { link = "DiagnosticWarn" },
          SnacksNotifierBorderInfo = { link = "DiagnosticInfo" },
          SnacksNotifierBorderDebug = { link = "Debug" },
          SnacksNotifierBorderTrace = { link = "Comment" },
          SnacksNotifierIconError = { link = "DiagnosticError" },
          SnacksNotifierIconWarn = { link = "DiagnosticWarn" },
          SnacksNotifierIconInfo = { link = "DiagnosticInfo" },
          SnacksNotifierIconDebug = { link = "Debug" },
          SnacksNotifierIconTrace = { link = "Comment" },
          SnacksNotifierTitleError = { link = "DiagnosticError" },
          SnacksNotifierTitleWarn = { link = "DiagnosticWarn" },
          SnacksNotifierTitleInfo = { link = "DiagnosticInfo" },
          SnacksNotifierTitleDebug = { link = "Debug" },
          SnacksNotifierTitleTrace = { link = "Comment" },
          SnacksNotifierError = { link = "DiagnosticError" },
          SnacksNotifierWarn = { link = "DiagnosticWarn" },
          SnacksNotifierInfo = { link = "DiagnosticInfo" },
          SnacksNotifierDebug = { link = "Debug" },
          SnacksNotifierTrace = { link = "Comment" },
          -- SnacksProfiler
          SnacksProfilerIconInfo = { bg = theme.ui.bg_search, fg = theme.syn.fun },
          SnacksProfilerBadgeInfo = { bg = theme.ui.bg_visual, fg = theme.syn.fun },
          SnacksScratchKey = { link = "SnacksProfilerIconInfo" },
          SnacksScratchDesc = { link = "SnacksProfilerBadgeInfo" },
          SnacksProfilerIconTrace = { bg = theme.syn.fun, fg = theme.ui.float.fg_border },
          SnacksProfilerBadgeTrace = { bg = theme.syn.fun, fg = theme.ui.float.fg_border },
          SnacksIndent = { fg = theme.ui.bg_p2, nocombine = true },
          SnacksIndentScope = { fg = theme.ui.pmenu.bg, nocombine = true },
          SnacksZenIcon = { fg = theme.syn.statement },
          SnacksInputIcon = { fg = theme.ui.pmenu.bg },
          SnacksInputBorder = { fg = theme.syn.identifier },
          SnacksInputTitle = { fg = theme.syn.identifier },
          -- SnacksPicker
          SnacksPickerInputBorder = { fg = theme.syn.constant },
          SnacksPickerInputTitle = { fg = theme.syn.constant },
          SnacksPickerBoxTitle = { fg = theme.syn.constant },
          SnacksPickerSelected = { fg = theme.syn.number },
          SnacksPickerToggle = { link = "SnacksProfilerBadgeInfo" },
          SnacksPickerPickWinCurrent = { fg = theme.ui.fg, bg = theme.syn.number, bold = true },
          SnacksPickerPickWin = { fg = theme.ui.fg, bg = theme.ui.bg_search, bold = true },
        }
      end,
    },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
      flavour = "mocha",
      background = {
        light = "latte",
        dark = "mocha",
      },
      no_italic = false,
      no_bold = false,
      no_underline = false,
      styles = {
        comments = { "italic" },
        conditionals = { "italic", "bold" },
        loops = { "italic", "bold" },
        functions = { "italic", "bold" },
        variables = { "italic", "bold" },
        properties = { "italic", "bold" },
        types = { "italic" },
        operators = { "italic", "bold" },
      },
      default_integrations = true,
      integrations = {
        aerial = true,
        alpha = true,
        illuminate = true,
        blink_cmp = true,
        indent_blankline = { enabled = true },
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        grug_far = true,
        snacks = true,
        neotest = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        fzf = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = false,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    opts = {
      transparent_bg = true,
      show_end_of_buffer = true,
      italic_comment = true,
      integrations = { blink_cmp = true },
    },
    config = function(_, opts)
      local dracula = require("dracula")
      dracula.setup(opts)
      vim.o.spell = false
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      style = "night",
      integrations = { blink_cmp = true },
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "kanagawa",
      },
    },
  },
}
