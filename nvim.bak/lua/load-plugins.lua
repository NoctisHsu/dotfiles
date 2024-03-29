-- NVIM Plugins configuration
return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- lsp
    use("neovim/nvim-lspconfig")
    use({
      "glepnir/lspsaga.nvim",
      opt = true,
      branch = "main",
      event = "LspAttach",
      config = function()
          require("lspsaga").setup({})
      end,
      requires = {
          {"nvim-tree/nvim-web-devicons"},
          --Please make sure you install markdown and markdown_inline parser
          {"nvim-treesitter/nvim-treesitter"}
      }
  })

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })

    use("kyazdani42/nvim-web-devicons")
    -- LuaLine
    use({
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    use("lukas-reineke/indent-blankline.nvim")

    use({ "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" }, run = "./install --bin" })

    -- Autocomplete
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-cmdline", -- command line
        "hrsh7th/cmp-buffer", -- buffer completions
        "hrsh7th/cmp-nvim-lua", -- nvim config completions
        "hrsh7th/cmp-nvim-lsp", -- lsp completions
        "hrsh7th/cmp-path", -- file path completions
        "saadparwaiz1/cmp_luasnip", -- snippets completions
      },
    })

    -- copilot
    use { "zbirenbaum/copilot.lua" }
    use {
      "zbirenbaum/copilot-cmp",
      after = { "copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }

    use({
      "stevearc/aerial.nvim",
      config = function()
        require("aerial").setup()
      end,
    })

    -- snippets
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        "rafamadriz/friendly-snippets",
      },
    })

    -- Git relation features
    use("tpope/vim-fugitive")
    use("tpope/vim-surround")

    -- commenting
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({ "numToStr/Comment.nvim", tag = "v0.6" })

    -- windwp
    use("windwp/nvim-ts-autotag") -- auto close and rename tags
    use("windwp/nvim-autopairs")
    use("windwp/nvim-spectre") -- Spectre for find and replace

    -- Formatting
    use("mhartington/formatter.nvim")

    use("airblade/vim-gitgutter")

    -- hightlight matching tag in html,jsx etc.
    use("leafOfTree/vim-matchtag")

    use({
      "phaazon/hop.nvim",
      as = "hop",
      config = function()
        require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      end,
    })

    -- file tree
    use({
      "kyazdani42/nvim-tree.lua",
      requires = { "kyazdani42/nvim-web-devicons" },
    })
    -- icons in completion
    use("onsails/lspkind-nvim")

    -- Folke plugins
    -- Theme
    use("folke/tokyonight.nvim")

    use({
      "https://gitlab.com/__tpb/monokai-pro.nvim",
      as = "monokai-pro.nvim",
    })

    -- Trouble
    use({
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup({})
      end,
    })

    -- WhichKey
    use("folke/which-key.nvim")

    -- Todo comments
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    })

    -- Colorizer
    use("norcalli/nvim-colorizer.lua")

    -- jsonc file type for json - comments in json
    use("kevinoid/vim-jsonc")

    -- bufferline for buffers in 'tabs'
    use({ "akinsho/bufferline.nvim", tag = "*", requires = "kyazdani42/nvim-web-devicons" })

    -- better code action menu

    -- Rich presence in Discord
    use("andweeb/presence.nvim")

    -- Dashboard
    use("goolord/alpha-nvim")

    -- project manager
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("project_nvim").setup({
          -- the option to manually do so using `:ProjectRoot` command.
          manual_mode = false,
          -- Methods of detecting the root directory. **"lsp"** uses the native neovim
          -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
          -- order matters: if one is not detected, the other is used as fallback. You
          -- can also delete or rearangne the detection methods.
          -- detection_methods = { "lsp", "pattern" },
          -- All the patterns used to detect root dir, when **"pattern"** is in
          -- detection_methods
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
          show_hidden = true,
          silent_dir = false,
        })
      end,
    })

    use({
      "akinsho/toggleterm.nvim",
      tag = "v2.*",
      config = function()
        require("toggleterm").setup()
      end,
    })

    use({
      "iamcco/markdown-preview.nvim",
      run = function()
        vim.fn["mkdp#util#install"]()
      end,
    })

    use({
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          stages = "fade_in_slide_out",
          background_colour = "FloatShadow",
          timeout = 3000,
        })
        vim.notify = require("notify")
      end,
    })

    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
    })
  end,
})
