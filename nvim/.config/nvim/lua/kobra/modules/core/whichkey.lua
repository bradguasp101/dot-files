local M = {}

M.setup = function()
  require('which-key').setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    window = {
      border = 'double',
      position = 'bottom',
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
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

  local vopts = {
    mode = "v", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local vmappings = {
    ["/"] = { "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>", "Comment" },
    ["w"] = { "<cmd>GBrowse<cr>", "GBrowse" },
    ["b"] = { "<cmd>GBrowse<cr>", "GBrowse" },
  }

  local mappings = {
    q = { "<cmd>q!<cr>", "Quit" },
    w = { "<cmd>w<cr>", "Write" },
    e = { "<cmd>NvimTreeToggle<cr>", "File Tree" },

    f = { "<cmd>Telescope find_files <cr>", "Find File" },
    g = { "<cmd>Telescope live_grep <cr>", "Grep String" },
    H = { ":set hlsearch!<cr>", "No Highlight" },

    d = {
      name = "Diagnostics",
      g = { "<cmd>Telescope diagnostics<cr>", "Telescope Document Diagnostics" },
      h = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Hover Diagnostic" },
      n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
      N = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
      q = { "<cmd>lua vim.diagnostic.setqflist()<cr>", "Quickfix Diagnostics" },
    },

    D = {
      name = "Databases",
      o = { "<cmd>:terminal kubectl port-forward $(kubectl get pods -l=app=matrix-db-cloudsql -o jsonpath=\"{.items[0].metadata.name}\") 5432:5432 <cr> :DBUI <cr>",
        "Open dev db" },
      u = { "<cmd>NvimTreeClose<cr><cmd>DBUI<cr>", "View Connections" },
    },

    h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Type Information. Hover LSP" },

    b = {
      name = "Buffers",
      c = { "<cmd>BufferClose<cr>", "Close" },
      p = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
      e = { "<cmd>BufferLinePickClose<cr>", "Pick which buffer to close" },
      l = { "<cmd>BufferCloseBuffersLeft<cr>", "Close all to the left" },
      r = { "<cmd>BufferCloseBuffersRight<cr>", "Close all to the right" },
      D = { "<cmd>BufferLineSortByDirectory<cr>", "Sort by directory" },
      L = { "<cmd>BufferLineSortByExtension<cr>", "Sort by language" },
    },

    p = {
      name = "Plz and Project",
      b = { function() require('kobra.utils.please').plzBuild() end, "Plz Build" },
      t = { function() require('kobra.utils.please').plzTest() end, "Plz Test" },
    },

    n = {
      name = "Neorg",
      g = { "<cmd>Neorg gtd views<cr>", "Views" },
      c = { "<cmd>Neorg gtd capture<cr>", "New Task" },
      e = { "<cmd>Neorg gtd edit<cr>", "Edit Task" },
    },

    P = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },

    G = {
      name = "+Git",
      j = { "<cmd>NextHunk<cr>", "Next Hunk" },
      k = { "<cmd>PrevHunk<cr>", "Prev Hunk" },
      p = { "<cmd>PreviewHunk<cr>", "Preview Hunk" },
      r = { "<cmd>ResetHunk<cr>", "Reset Hunk" },
      R = { "<cmd>ResetBuffer<cr>", "Reset Buffer" },
      s = { "<cmd>StageHunk<cr>", "Stage Hunk" },
      u = { "<cmd>UndoStageHunk<cr>", "Undo Stage Hunk" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Git blame<cr>", "Open blame window" },
      B = { "<cmd>GitBlameToggle<cr>", "Toggle blame on current line" },
      w = { "<cmd>GBrowse<cr>", "Open in git browser" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
      a = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      d = {
        name = "Diff",
        o = { "<cmd>DiffviewOpen<cr>", "Open View" },
        c = { "<cmd>DiffviewClose<cr>", "Close View" },
        h = { "<cmd>DiffviewFileHistory<cr>", "History" },
      },
    },

    l = {
      name = "+LSP",
      d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
      I = { "<cmd>LspInfo<cr>", "Info" },
      i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
      a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Type Information" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
      S = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
      w = {
        name = "Workspace",
        l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", "List Workspace Folders" },
        -- TODO should populate the function with the parameter for workspace folder
        -- also have no clue wtf this does
        w = { "<cmd>lua vim.lsp.buf.add_workspace_folders()<cr>", "Add Workspace Folder" },
        W = { "<cmd>lua vim.lsp.buf.remove_workspace_folders()<cr>", "Remove Workspace Folder" },
        -- TODO get this working :) the query is bad
        -- x = {"<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols"},
      },
      o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
    },

    s = {
      name = "+Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      d = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
      f = { "<cmd>Telescope find_files <cr>", "Find File" },
      m = { "<cmd>Telescope marks<cr>", "Marks" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      t = { "<cmd>Telescope live_grep <cr>", "Text" },
    },

    t = {
      name = "Telescope",
      r = { "<cmd>Telescope resume<cr>", "Resume" },
      f = {
        name = "Find",
        f = { "<cmd>Telescope find_files <cr>", "Find File" },
        s = { "<cmd>Telescope grep_string<cr>", "Find String Under Cursor" },
        g = { "<cmd>Telescope live_grep <cr>", "Live Grep" },
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help Tags" },
        c = { "<cmd>Telescope command_history<cr>", "List Commands That Were Executed" },
        q = { "<cmd>Telescope quickfix<cr>", "List Items In The Quikcfix List" },
        e = { "<cmd>Telescope notify<cr>", "Notifications" },
      },
      t = {
        name = "Treesitter",
        t = { "<cmd>Telescope treesitter<cr>", "List Function names, variables, from Treesitter" },
      },
    },

    Q = {
      name = "Quickfix List",
      n = { "<cmd>cn<cr>", "Next" },
      p = { "<cmd>cp<cr>", "Previous" },
      c = { "<cmd>cclose<cr>", "Close" },
      o = { "<cmd>copen<cr>", "Open" },
      v = { "<cmd>vopen<cr>", "Open item in vertical split" },
      q = { "<cmd>cdo g//norm @q <cr>", "Run @q macro on quickfix list" },
    },

    z = {
      name = "Spelling",
      n = { "]s", "Next" },
      p = { "[s", "Previous" },
      a = { "zg", "Add word" },
      f = { "1z=", "Use 1. correction" },
      l = { "<cmd>Telescope spell_suggest<cr>", "List corrections" },
    },
  }

  require('which-key').register(mappings, opts)
  require('which-key').register(vmappings, vopts)
end

return M
