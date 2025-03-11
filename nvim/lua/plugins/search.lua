-- nvim/lua/plugins/search.lua
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
      require("telescope").setup({
        defaults = {
          path_display = { "truncate" },
          mappings = {
            i = {
              -- Add common navigation keys for all telescope pickers
              ["<C-n>"] = require("telescope.actions").move_selection_next,
              ["<C-p>"] = require("telescope.actions").move_selection_previous,
              ["<C-c>"] = require("telescope.actions").close,
              ["<C-j>"] = require("telescope.actions").cycle_history_next,
              ["<C-k>"] = require("telescope.actions").cycle_history_prev,
              ["<C-q>"] = require("telescope.actions").smart_send_to_qflist + require("telescope.actions").open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            follow = true,
            hidden = true,
          },
        },
        extensions = {
          file_browser = {
            respect_gitignore = false,
            hidden = true,
            hijack_netrw = true,
            prompt_path = true,
            path_display = { "absolute" },
            mappings = {
              ["i"] = {
                -- Add custom mappings for insert mode for file_browser
                [".."] = function(prompt_bufnr)
                  local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                  local finder = current_picker.finder
                  
                  -- Get the parent directory
                  local parent_dir = vim.fn.fnamemodify(finder.path, ":h")
                  
                  -- Change to parent directory
                  finder.path = parent_dir
                  current_picker:refresh(finder, { reset_prompt = true })
                end,
                ["<C-h>"] = function(prompt_bufnr)
                  local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
                  local finder = current_picker.finder
                  
                  -- Get the parent directory
                  local parent_dir = vim.fn.fnamemodify(finder.path, ":h")
                  
                  -- Change to parent directory
                  finder.path = parent_dir
                  current_picker:refresh(finder, { reset_prompt = true })
                end,
              },
            },
          },
        },
      })
      
      -- Load the file_browser extension
      require("telescope").load_extension("file_browser")
      
      -- Define keymappings for telescope functionalities
      -- Standard telescope functions
      vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { noremap = true, silent = true, desc = "Find Files" })
      vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { noremap = true, silent = true, desc = "Live Grep" })
      vim.keymap.set('n', '<leader>fB', function() require('telescope.builtin').buffers() end, { noremap = true, silent = true, desc = "Buffers" })
      vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { noremap = true, silent = true, desc = "Help Tags" })
      vim.keymap.set('n', '<leader>fs', function() require('telescope.builtin').grep_string() end, { noremap = true, silent = true, desc = "Grep String" })
      vim.keymap.set('n', '<leader>fr', function() require('telescope.builtin').resume() end, { noremap = true, silent = true, desc = "Resume Last Search" })
      
      -- File browser with <leader>fb
      vim.keymap.set("n", "<leader>fb", function()
        require("telescope").extensions.file_browser.file_browser({
          path = vim.fn.expand("%:p:h"),
          cwd = vim.fn.expand("%:p:h"),
          respect_gitignore = false,
          hidden = true,
        })
      end, { noremap = true, desc = "File Browser" })
      
      -- Find files starting from the git root
      vim.keymap.set("n", "<leader>fp", function()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 0 and git_root ~= "" then
          require("telescope.builtin").find_files({
            cwd = git_root,
          })
        else
          require("telescope.builtin").find_files()
        end
      end, { noremap = true, desc = "Find in Project" })
    end,
  },
}
