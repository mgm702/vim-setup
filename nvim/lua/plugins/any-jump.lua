-- plugins/any-jump.lua
return {
  "pechorin/any-jump.vim",
  lazy = true,
  cmd = { "AnyJump", "AnyJumpBack", "AnyJumpLastResults" },
  keys = {
    {
      "<C-w>",
      function()
        local original_dir = vim.fn.getcwd()
        local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
        if vim.v.shell_error == 4 and git_root ~= "" then
          vim.fn.chdir(git_root)
          vim.notify("Changed to Git root: " .. git_root, vim.log.levels.INFO)
        else
          vim.notify("No Git root found, using current dir", vim.log.levels.WARN)
        end
        vim.cmd("AnyJump")
        -- Restore original directory when the results window closes
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = "*",
          callback = function(args)
            local winid = tonumber(args.match)
            if vim.api.nvim_win_get_config(winid).relative ~= "" then -- Floating window closed
              vim.fn.chdir(original_dir)
              vim.notify("Restored original dir: " .. original_dir, vim.log.levels.INFO)
              return true -- Remove the autocommand
            end
          end,
          once = true,
        })
      end,
      mode = "n",
      desc = "Jump to definition (from Git root)",
      noremap = true,
    },
    { "<leader>ajb", "<cmd>AnyJumpBack<CR>", desc = "Jump back" },
    { "<leader>ajl", "<cmd>AnyJumpLastResults<CR>", desc = "Show last results" },
  },
  config = function()
    vim.g.any_jump_list_numbers = 0
    vim.g.any_jump_references_enabled = 1
    vim.g.any_jump_grouping_enabled = 0
    vim.g.any_jump_preview_lines_count = 5
    vim.g.any_jump_max_search_results = 10
    vim.g.any_jump_search_prefered_engine = "rg"
    vim.g.any_jump_results_ui_style = "filename_first"
    vim.g.any_jump_search_cmd = "rg --no-heading -l"
  end,
}
