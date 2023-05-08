local M = {}

-- M[#M + 1] = {
--   "https://codeberg.org/esensar/nvim-dev-container",
--   config = true,
-- }

M[#M + 1] = {
  "skanehira/denops-docker.vim",
  dependencies = { "vim-denops/denops.vim" },
}

M[#M + 1] = {
  "kkvh/vim-docker-tools",
  cmd = {
    "DockerToolsOpen",
    "DockerToolsClose",
    "DockerToolsToggle",
    "DockerToolsSetHost",
  },
  keys = {
    { "<leader>kto", "<cmd>DockerToolsOpen<cr>", desc = "Open Docker Tools" },
    { "<leader>ktc", "<cmd>DockerToolsClose<cr>", desc = "Close Docker Tools" },
    { "<leader>ktt", "<cmd>DockerToolsToggle<cr>", desc = "Toggle Docker Tools" },
    { "<leader>kth", "<cmd>DockerToolsSetHost<cr>", desc = "Set Docker Tools Host" },
  },
}

M[#M + 1] = {
  "jamestthompson3/nvim-remote-containers",
  cmd = {
    "AttachToContainer",
    "BuildImage",
    "StartImage",
    "ComposeUp",
    "ComposeDown",
    "ComposeDestroy",
  },
  keys = {
    { "<leader>ka", "<cmd>AttachToContainer<cr>", desc = "Attach to Container" },
    { "<leader>kb", "<cmd>BuildImage<cr>", desc = "Build Image" },
    { "<leader>ks", "<cmd>StartImage<cr>", desc = "Start Image" },
    { "<leader>ku", "<cmd>ComposeUp<cr>", desc = "Start docker-compose" },
    { "<leader>kd", "<cmd>ComposeDown<cr>", desc = "Stop docker-compose" },
    { "<leader>kx", "<cmd>ComposeDestroy<cr>", desc = "Kill docker-compose" },
  },
}

M[#M + 1] = {
  "skywind3000/asyncrun.vim",
  cmd = "AsyncRun",
  config = function()
    vim.g.asyncrun_open = 8
  end,
}

M[#M + 1] = {
  "folke/which-key.nvim",
  opts = {
    defaults = {
      ["<leader>k"] = { name = "+containers" },
      ["<leader>kt"] = { name = "+tools" },
      ["<leader>kc"] = { name = "+docker" },
      -- ["<leader>kcs"] = { "<cmd>tabnew | r ! colima start<cr>", "Start Docker" },
      -- ["<leader>kcd"] = { "<cmd>tabnew | r ! colima stop<cr>", "Stop Docker" },
      ["<leader>kcs"] = { "<cmd>AsyncRun colima start<cr>", "Start Docker" },
      ["<leader>kcd"] = { "<cmd>AsyncRun colima stop<cr>", "Stop Docker" },
    },
  },
}

return M
