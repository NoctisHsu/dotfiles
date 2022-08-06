return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- lsp
    use("neovim/nvim-lspconfig")

    -- Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    -- Treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })

    -- LuaLine
    use({
      "hoob3rt/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

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

    -- snippets
    use({
      "L3MON4D3/LuaSnip",
      requires = {
        "rafamadriz/friendly-snippets",
      },
    })

    -- tpope
    use("tpope/vim-fugitive")
    -- use("tpope/vim-surround")

    -- commenting
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({ "numToStr/Comment.nvim", tag = "v0.6" })

    -- move between kitty windows
    use("knubie/vim-kitty-navigator")

    -- windwp
    use("windwp/nvim-ts-autotag") -- auto close and rename tags
    use("windwp/nvim-autopairs")
    -- use("windwp/nvim-spectre") -- Spectre for find and replace

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

    -- Undotree
    --use("mbbill/undotree")

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
    use({
      "weilbith/nvim-code-action-menu",
      cmd = "CodeActionMenu",
    })

    -- firebase rules
    -- use("delphinus/vim-firestore")

    -- sessions
    use({
      "rmagatti/auto-session",
      config = function()
        require("auto-session").setup({
          log_level = "info",
          auto_session_suppress_dirs = { "~/", "~/Projects" },
        })
      end,
    })

    use({
      "rmagatti/session-lens",
      config = function()
        require("session-lens").setup({--[[your custom config--]]
        })
      end,
    })

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
          detection_methods = { "lsp", "pattern" },
          -- All the patterns used to detect root dir, when **"pattern"** is in
          -- detection_methods
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        })
      end,
    })
  end,
})
