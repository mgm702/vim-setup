local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- Syntax highlighting
  { "nvim-treesitter/nvim-treesitter", config = function() require("config.treesitter") end },
  -- File explorer
  { "nvim-tree/nvim-tree.lua", config = function() require("config.nvim-tree") end },
  -- Status line
  { "nvim-lualine/lualine.nvim", config = function() require("config.lualine") end },
  -- Git integration
  { "lewis6991/gitsigns.nvim", config = function() require("config.gitsigns") end },
  
  -- Vim ColorScheme
  { "EdenEast/nightfox.nvim" },
  { "folke/tokyonight.nvim" },
  { 
    "NTBBloodbath/doom-one.nvim",
    priority = 1000,
    config = function()
      -- Set to light mode before loading the colorscheme
      vim.g.doom_one_dark_mode = false
      
      -- Configure doom-one with global variables
      vim.g.doom_one_terminal_colors = true
      vim.g.doom_one_cursor_coloring = true
      vim.g.doom_one_italic_comments = true
      vim.g.doom_one_enable_treesitter = true
      vim.g.doom_one_transparent_background = false
      vim.g.doom_one_pumblend_enable = true
      vim.g.doom_one_pumblend_transparency = 20
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_telescope = true
      vim.g.doom_one_plugin_gitsigns = true
      
      -- Now set the colorscheme
      vim.cmd("colorscheme doom-one")
    end
  },
  
  -- Avante.nvim with all necessary dependencies
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set to false to update to latest code changes
    opts = {
      provider = "claude", -- Set default provider
      -- Provider configurations
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-7-sonnet-20250219",
        timeout = 30000,
        temperature = 0,
        max_tokens = 4096,
      },
      grok = {
        model = "grok-2-1212",
        temperature = 0,
        max_tokens = 4096,
      },
      file_selector = {
        -- Set your preferred file selector
        provider = "telescope", -- Options: "telescope", "mini.pick", "fzf"
      },
    },
    build = "make", -- "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim", -- Required dependency that was missing
      "MunifTanjim/nui.nvim",
      -- File selector providers
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      -- Other useful integrations
      "nvim-tree/nvim-web-devicons",
      "hrsh7th/nvim-cmp", -- Autocompletion for avante commands
      "zbirenbaum/copilot.lua",
      -- Image support
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true, -- Required for Windows users
          },
        },
      },
      -- Markdown rendering
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    config = function()
      -- This allows config.avante to override the opts above if needed
      require("config.avante")
    end,
  },
  -- Commented Vimscript plugins (optional)
  -- { "tpope/vim-fugitive", -- Git integration; use if gitsigns.nvim isn't enough },
  -- { "tomasiser/vim-code-dark", -- Codedark theme, already loaded via vim.cmd },
})

vim.opt.termguicolors = true
