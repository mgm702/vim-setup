return function()
  local oil = require("oil")
  oil.setup({
    -- Skip confirmation for simple file operations
    skip_confirm_for_simple_edits = true,

    -- Keymappings
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.tcd", desc = "Set cwd for current tab" },
      -- Custom function to create a directory
      ["+d"] = {
        function()
          local path = oil.get_current_dir()
          vim.ui.input({ prompt = "Create directory: " .. path }, function(input)
            if input then
              local new_dir = path .. input
              vim.fn.system("mkdir -p " .. vim.fn.shellescape(new_dir))
              vim.cmd("edit")
            end
          end)
        end,
        mode = "n"
      },
    },

    -- File view options
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
      -- This function defines what is considered a "hidden" file
      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        return m ~= nil
      end,
      -- Sort file names with numbers in a more intuitive order for humans
      natural_order = true,
      -- Sort file and directory names case insensitive
      case_insensitive = false,
      sort = {
        -- sort order can be "asc" or "desc"
        { "type", "asc" },
        { "name", "asc" },
      },
    },

    -- Integration with other plugins
    use_default_keymaps = false,

    -- Buffer appearance
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
  })

  -- Set up keymapping to open Oil with '-'
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

  -- Override :e in Oil buffers to open and sync cwd silently
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "oil://*",
    callback = function()
      vim.api.nvim_buf_set_keymap(0, "n", "<C-c>e", "<Cmd>lua require('oil').open(require('oil').get_current_dir()); vim.cmd('cd ' .. vim.fn.fnameescape(require('oil').get_current_dir()))<CR>", { silent = true })
      -- Define a custom command to replace :e
      vim.api.nvim_buf_create_user_command(0, "E", function()
        local oil = require("oil")
        local current_dir = oil.get_current_dir()
        oil.open(current_dir)
        vim.cmd("cd " .. vim.fn.fnameescape(current_dir))
        -- Clear the command-line prompt
        vim.cmd("redraw!")
        -- Show a custom message
        vim.notify("cwd is now: " .. current_dir, vim.log.levels.INFO)
      end, { nargs = 0 })
      -- Use silent cabbrev to map :e to :E
      vim.api.nvim_buf_call(0, function()
        vim.cmd([[silent! cabbrev <buffer> e E]])
      end)
    end,
  })

  -- Telescope Integration
  local telescope_loaded, telescope = pcall(require, "telescope")
  if telescope_loaded then
    local builtin = require("telescope.builtin")
    -- Function to open Oil in the selected directory
    local function open_selected_in_oil(prompt_bufnr)
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")
      local selection = action_state.get_selected_entry()
      actions.close(prompt_bufnr)
      if selection and selection.path then
        oil.open(selection.path)
      end
    end

    -- Create Telescope commands that work with Oil
    vim.api.nvim_create_user_command("OilFindDir", function()
      builtin.find_files({
        find_command = { "find", ".", "-type", "d", "-not", "-path", "*/\\.*" },
        attach_mappings = function(_, map)
          map("i", "<CR>", open_selected_in_oil)
          map("n", "<CR>", open_selected_in_oil)
          return true
        end,
      })
    end, {})
  end
end
