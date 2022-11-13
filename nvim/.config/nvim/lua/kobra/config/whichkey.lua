local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup({
  window = {
    border = "single", -- none, single, double, shadow
    position = "bottom", -- bottom, top
  },
})

local opts = {
  mode = "n", -- Normal mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local telescope_ok, telescope = pcall(require, 'telescope')
if telescope_ok then
  telescope.load_extension('dap')
end

local mappings = {
  ["w"] = { "<cmd>update!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },

  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Files" },

  ["ld"] = { [[<cmd>lua require("lsp_lines").toggle()<cr>]], "Line Diagnostics" },

  b = {
    name = "Buffer",
    c = { "<cmd>Bdelete!<cr>", "Close current buffer" },
    D = { "<cmd>%bd|e#|bd#<cr>", "Delete all buffers" },
  },

  d = {
    name = "Databases",
    o = {"<cmd>NvimTreeClose<cr><cmd>DBUI<cr>", "Open Connections"},
  },

  P = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  s = {
    name = "+Search",
    S = {[[<cmd>lua require("spectre").open()<cr>]], "Spectre"},
    s = {[[<cmd>lua require("spectre").open_visual()<cr>]], "Search"},
    w = {[[<cmd>lua require("spectre").open_visual({select_word = true})<cr>]], "Search Word"},
    c = {[[<cmd>lua require("spectre").open_file_search()<cr>]], "Search File"},
    b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
    d = {"<cmd>Telescope diagnostics<cr>", "Document diagnostics"},
    f = {"<cmd>Telescope find_files <cr>", "Find File"},
    m = {"<cmd>Telescope marks<cr>", "Marks"},
    M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
    r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
    R = {"<cmd>Telescope registers<cr>", "Registers"},
    t = {"<cmd>Telescope live_grep <cr>", "Text"},
  },

  g = {
    name = "+Git",
    l = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
    y = { [[<cmd>GBrowse<cr>]], "Browse" },
    d = {
      name = "Diff",
      o = {"<cmd>DiffviewOpen<cr>", "Open View"},
      c = {"<cmd>DiffviewClose<cr>", "Close View"},
      h = {"<cmd>DiffviewFileHistory<cr>", "History"},
    },
  },

  t = {
    name = "Telescope",
    r = {"<cmd>Telescope resume<cr>", "Resume"},
    f = {
      name = "Find",
      f = {"<cmd>Telescope find_files <cr>", "Find File"},
      s = {"<cmd>Telescope grep_string<cr>", "Find String Under Cursor"},
      g = {"<cmd>Telescope live_grep <cr>", "Live Grep"},
      b = {"<cmd>Telescope buffers<cr>", "Find Buffers"},
      h = {"<cmd>Telescope help_tags<cr>", "Find Help Tags"},
      c = {"<cmd>Telescope command_history<cr>", "List Commands That Were Executed"},
      q = {"<cmd>Telescope quickfix<cr>", "List Items In The Quikcfix List"},
    },
    t = {
      name = "Treesitter",
      t = {"<cmd>Telescope treesitter<cr>", "List Function names, variables, from Treesitter"},
    },
  },

  T = {
    name = "Terminal",
    t = {"<cmd>ToggleTerm<cr>", "Toggle"},
  },

  Q = {
    name = "Quickfix List",
    n = {"<cmd>cn<cr>", "Next"},
    p = {"<cmd>cp<cr>", "Previous"},
    c = {"<cmd>cclose<cr>", "Close"},
    o = {"<cmd>copen<cr>", "Open"},
    v = {"<cmd>vopen<cr>", "Open item in vertical split"},
  },

  z = {
    name = "Spelling",
    n = { "]s", "Next" },
    p = { "[s", "Previous" },
    a = { "zg", "Add word" },
    f = { "1z=", "Use 1. correction" },
    l = { "<cmd>Telescope spell_suggest<cr>", "List corrections" },
  },

  -- DAP
  D = {
    name = "DAP",
    c = {"<cmd>lua require('dap').continue()<cr>", "Continue"},
    sv = {"<cmd>lua require('dap').step_over()<cr>", "Step Over"},
    si = {"<cmd>lua require('dap').step_into()<cr>", "Step Into"},
    so = {"<cmd>lua require('dap').step_out()<cr>", "Step Out"},
    sc = {"<cmd>lua require('dap.ui.variables').scopes()<cr>", "Variable Scopes"},
    hh = {"<cmd>lua require('dap.ui.variables').hover()<cr>", "Hover Variables"},
    uh = {"<cmd>lua require('dap.ui.widgets').hover()<cr>", "Widgets"},
    uf = {"<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>", "Widget Scopes"},
    tb = {"<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle Breakpoint"},
    sbr = {"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Set Breakpoint"},
    sbm = {"<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "Set Log Point"},
    ro = {"<cmd>lua require('dap').repl.open()<cr>", "Open Repl"},
    rl = {"<cmd>lua require('dap').repl.run_last()<cr>", "Run Last Repl"},

    cc = {"<cmd>lua require('telescope').extensions.dap.commands{}<cr>", "Commands"},
    co = {"<cmd>lua require('telescope').extensions.dap.configurations{}<cr>", "Configurations"},
    lb = {"<cmd>lua require('telescope').extensions.dap.list_breakpoints{}<cr>", "List Breakpoints"},
    v = {"<cmd>lua require('telescope').extensions.dap.variables{}<cr>", "Variables"},
    f = {"<cmd>lua require('telescope').extensions.dap.frames{}<cr>", "Frames"},
  },
}

local v_opts = {
  mode = "v",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
}

local v_mappings = {
  g = {
    name = "+Git",
    y = { [[<cmd>lua require("gitlinker").get_buf_range_url("v")<cr>]], "GitLink" },
  },

  D = {
    name = "DAP",
    hv = {"<cmd>lua require('dap.ui.variables').visual_hover()<cr>", "Variables"},
  }
}

whichkey.register(mappings, opts)
whichkey.register(v_mappings, v_opts)
