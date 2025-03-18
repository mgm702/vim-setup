-- nvim/lua/plugins/legacy.lua
return {
  { "mattn/emmet-vim" },    -- Emmet for HTML/CSS
  { "mattn/webapi-vim" },   -- Dependency for gist-vim
  { "mattn/gist-vim" },     -- Gist posting
  {
    "tpope/vim-bundler",
    lazy = false, -- Load immediately
    ft = "ruby"   -- Load when Ruby files are opened
  },
  {
    "tpope/vim-rails",
    lazy = false, -- Load immediately
    ft = "ruby"   -- Load when Ruby files are opened
  }
}
