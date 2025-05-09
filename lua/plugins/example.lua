if true then
  return {
    {
      "folke/which-key.nvim",
      opts = {
        preset = "classic",
      },
    },
    {
      "kawre/leetcode.nvim",
      cmd = "Leet",
      build = ":TSUpdate html",
      opts = {
        lang = "javascript",
      },
    },
    {
      "danilamihailov/beacon.nvim",
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        inlay_hints = {
          enabled = false,
        },
        servers = {
          vtsls = {
            settings = {
              typescript = {
                format = {
                  insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                },
              },
              javascript = {
                format = {
                  insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
                },
              },
            },
          },
        },
      },
    },
    {
      "mistweaverco/kulala.nvim",
      opts = {
        winbar = true,
      },
      ft = { "http", "rest" },
      global_keymaps = true,
      config = function()
        local kulala = require("kulala")

        vim.keymap.set("n", "<Leader>kr", kulala.run, { desc = "Kulala run" })
        vim.keymap.set("n", "<Leader>ka", kulala.run_all, { desc = "Kulala run all" })
        vim.keymap.set("n", "<Leader>kl", kulala.replay, { desc = "Kulala replay" })
        vim.keymap.set("n", "<Leader>ki", kulala.inspect, { desc = "Kulala ispect" })
        vim.keymap.set("n", "<Leader>ks", kulala.show_stats, { desc = "Kulala stats" })
        vim.keymap.set("n", "<Leader>kv", kulala.toggle_view, { desc = "Kulala view" })
        vim.keymap.set("n", "<Leader>kc", kulala.copy, { desc = "Kulala copy" })
        vim.keymap.set("n", "<Leader>kf", kulala.from_curl, { desc = "Kulala from curl" })
        vim.keymap.set("n", "<Leader>kn", kulala.jump_next, { desc = "Kulala jump next" })
        vim.keymap.set("n", "<Leader>kp", kulala.jump_prev, { desc = "Kulala jump prev" })
      end,
    },
    {
      "gbprod/yanky.nvim",
      opts = {
        preserve_cursor_position = {
          enabled = true,
        },
      },
      keys = {
        { "y", mode = { "n", "x" }, "<Plug>(YankyYank)" },
        { "p", mode = { "n", "x" }, "<Plug>(YankyPutAfter)" },
        { "P", mode = { "n", "x" }, "<Plug>(YankyPutBefore)" },
        { "gp ", mode = { "n", "x" }, "<Plug>(YankyGPutAfter)" },
        { "gP", mode = { "n", "x" }, "<Plug>(YankyGPutBefore)" },
        { "<c-p>", mode = { "n" }, "<Plug>(YankyPreviousEntry)" },
        { "<c-n>", mode = { "n" }, "<Plug>(YankyNextEntry)" },
        { "]p", mode = { "n" }, "<Plug>(YankyPutIndentAfterLinewise)" },
        { "[p", mode = { "n" }, "<Plug>(YankyPutIndentBeforeLinewise)" },
        { "]P", mode = { "n" }, "<Plug>(YankyPutIndentAfterCharwise)" },
        { "[P", mode = { "n" }, "<Plug>(YankyPutIndentBeforeCharwise)" },
      },
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          bind_to_cwd = true,
        },
      },
      {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = {
          modes = { insert = true, command = false, terminal = false },
        },
      },
    },
    {
      "folke/snacks.nvim",
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = {
          notify = true, -- show notification when big file detected
          size = 1.5 * 1024 * 1024, -- 1.5MB
          line_length = 100000, -- average line length (useful for minified files)
          -- Enable or disable features when big file detected
          ---@param ctx {buf: number, ft:string}
          setup = function(ctx)
            if vim.fn.exists(":NoMatchParen") ~= 0 then
              vim.cmd([[NoMatchParen]])
            end
            Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
            vim.b.minianimate_disable = true
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(ctx.buf) then
                vim.bo[ctx.buf].syntax = ctx.ft
              end
            end)
          end,
        },
        notifier = {
          timeout = 10000,
          width = { min = 50 },
        },
      },
    },
    {
      "akinsho/toggleterm.nvim",
      config = true,
      cmd = "ToggleTerm",
      keys = {
        { "<C-\\>", mode = { "n", "t" }, "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
        { "<C-/>", mode = { "n", "t" }, "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
      },
      opts = {
        open_mapping = [[<C-\\>], [C-/]],
        direction = "float",
        shade_filetypes = {},
        hide_numbers = true,
        insert_mappings = true,
        terminal_mappings = true,
        start_in_insert = true,
        close_on_exit = true,
      },
    },
    {
      "ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker").setup({ disable_legacy_commands = true })

        local opts = { noremap = true, silent = true }

        vim.keymap.set("n", "<Leader>uy", "<cmd>IconPickerNormal<cr>", opts)
        vim.keymap.set("n", "<Leader>uY", "<cmd>IconPickerYank<cr>", opts) -- Yank the selected icon into register
        vim.keymap.set("i", "<C-y>", "<cmd>IconPickerInsert<cr>", opts)
      end,
    },
    {
      "nvim-pack/nvim-spectre",
      keys = {
        {
          "<leader>Q",
          "<cmd>lua require('spectre.actions').send_to_qf()<CR><cmd>q<CR>",
          desc = "send ALL to quickfix",
        },
      },
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "debugloop/telescope-undo.nvim",
      },
      keys = {
        { "<leader>gf", "<cmd>Telescope git_bcommits<CR>", desc = "buffer commits" },
        { "<leader>gF", "<cmd>Telescope git_bcommits_range<CR>", mode = "v", desc = "buffer commits range" },
        { "<leader>tu", "<cmd>Telescope undo<CR>", mode = "n", desc = "telescope undo" },
        { "<leader>th", "<cmd>Telescope yank_history<CR>", mode = "n", desc = "telescope yank history" },
      },
      opts = {
        defaults = {
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              width = 0.95,
              height = 0.95,
              preview_cutoff = 5,
              preview_height = 0.65,
            },
          },
        },
      },
    },
  }
end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "help",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
}
