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
    a = {
      a = { ":$tabnew<cr>", "New Tab" },
      c = { ":tabclose<cr>", "Close Tab" },
      m = {
        name= "Tab Move",
        p = { ":-tabmove<cr>", "Move Current Tab to Previous" },
        n = { ":+tabmove<cr>", "Move Current Tab to Next" },
      },
      n = { ":tabn<cr>", "Next Tab" },
      o = { ":tabonly<cr>", "Close All Other Tabs" },
      p = { ":tabp<cr>", "Previous Tab" },
    },

    b = {
      name = "Buffers",
      c = { "<cmd>BufferClose<cr>", "Close" },
      h = { "<cmd>WindowsMaximizeHorizontally<cr>", "Maximize Window Horizontally" },
      l = { "<cmd>Telescope buffers<cr>", "List buffers" },
      m = { "<cmd>WinShift<cr>", "Enter WinShift Mode" },
      M = { "<cmd>WindowsMaximize<cr>", "Maximize Window" },
      o = { function() vim.cmd('Oil ' .. vim.fn.expand('%:p:h')) end, "Open Current Directory" },
      s = { "<cmd>WinShift swap<cr>", "Swap Two Windows" },
      t = { "<cmd>WindowsToggleAutowidth<cr>", "Toggle Auto Width" },
      v = { "<cmd>WindowsMaximizeVertically<cr>", "Maximize Window Vertically" },
      ['='] = { "<cmd>WindowsEqualize<cr>", "Equalize Windows" },
    },

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

    f = {
      name = "+Find",
      d = { "<cmd>Telescope file_browser depth=false hidden=true<cr>", "Browse All Files and Folders" },
      f = { "<cmd>Telescope find_files hidden=true<cr>", "Find Files" },
      F = { "<cmd>Telescope file_browser path=%:p:h hidden=true<cr>", "Browse File and Folders" },
      z = { "<cmd>Telescope z list hidden=true<cr>", "Z" },
    },

    G = {
      name = "+Git",
      a = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      b = { "<cmd>Git blame<cr>", "Open blame window" },
      B = { "<cmd>GitBlameToggle<cr>", "Toggle blame on current line" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
      d = {
        name = "Diff",
        o = { "<cmd>DiffviewOpen<cr>", "Open View" },
        c = { "<cmd>DiffviewClose<cr>", "Close View" },
        h = { "<cmd>DiffviewFileHistory<cr>", "History" },
      },
      j = { "<cmd>NextHunk<cr>", "Next Hunk" },
      k = { "<cmd>PrevHunk<cr>", "Prev Hunk" },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      p = { "<cmd>PreviewHunk<cr>", "Preview Hunk" },
      r = { "<cmd>ResetHunk<cr>", "Reset Hunk" },
      R = { "<cmd>ResetBuffer<cr>", "Reset Buffer" },
      s = { "<cmd>StageHunk<cr>", "Stage Hunk" },
      u = { "<cmd>UndoStageHunk<cr>", "Undo Stage Hunk" },
      w = { "<cmd>GBrowse<cr>", "Open in git browser" },
    },

    H = { ":set hlsearch!<cr>", "No Highlight" },

    l = {
      name = "+LSP",
      a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
      d = { "<cmd>Glance definitions<cr>", "Go To Definition" },
      D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Type Information" },
      I = { "<cmd>LspInfo<cr>", "Info" },
      i = { "<cmd>Glance implementations<cr>", "Implementation" },
      o = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      R = { "<cmd>Glance references<cr>", "References" },
      S = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      t = { "<cmd>Glance type_definitions<cr>", "Type Definition" },
      T = {
        name = "Telescope",
        d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Diagnostics" },
        i = { "<cmd>Telescope lsp_incoming_calls<cr>", "Incoming Calls" },
        o = { "<cmd>Telescope lsp_outgoing_calls<cr>", "Outgoing Calls" },
        r = { "<cmd>Telescope lsp_references<cr>", "References" },
      },
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
    },

    L = { "<cmd>Lazy<cr>", "Lazy" },

    p = {
      name = "Plz and Project",
      -- b = { function() require('kobra.utils.please').plzBuild() end, "Plz Build" },
      -- t = { function() require('kobra.utils.please').plzTest() end, "Plz Test" },
      p = { "<cmd>lua require'telescope'.extensions.projects.projects{}<cr>", "List" },
      r = { function() require('kobra.scripts.revive').lint() end, "Revive" },
      s = { "<cmd>Telescope repo list<cr>", "Search" },
    },

    q = { "<cmd>q!<cr>", "Quit" },

    Q = {
      name = "Quickfix List",
      c = { "<cmd>cclose<cr>", "Close" },
      n = { "<cmd>cn<cr>", "Next" },
      o = { "<cmd>copen<cr>", "Open" },
      p = { "<cmd>cp<cr>", "Previous" },
      q = { "<cmd>cdo g//norm @q <cr>", "Run @q macro on quickfix list" },
      v = { "<cmd>vopen<cr>", "Open item in vertical split" },
    },

    s = {
      name = "+Search",
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      d = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
      f = { "<cmd>Telescope find_files hidden=true<cr>", "Find File" },
      g = { "<cmd>lua require'telescope'.extensions.live_grep_args.live_grep_args{}<cr>", "Text (args)" },
      m = { "<cmd>Telescope marks<cr>", "Marks" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      n = { "<cmd>Navbuddy<cr>", "Navbuddy" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      s = { "<cmd>Telescope grep_string<cr>", "Current String" },
      S = { "<cmd>SearchSession<cr>", "Sessions" },
      t = { "<cmd>Telescope live_grep <cr>", "Text" },
      T = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
    },

    S = {
      name = "Sessions",
      c = { "<cmd>PossessionClose<cr>", "Close Session" },
      d = { function() require('kobra.scripts.input').exec('PossessionDelete') end, "Delete Session" },
      l = { function() require('kobra.scripts.input').exec('PossessionLoad') end, "Load Session" },
      m = { "<cmd>PossessionMigrate<cr>", "Migrate Sessions" },
      s = { "<cmd>Telescope possession list<cr>", "List Sessions" },
      S = { "<cmd>PossessionShow<cr>", "Show Session" },
      w = { "<cmd>PossessionSave<cr>", "Save Session" },
      W = { function() require('kobra.scripts.input').exec('PossessionSave') end, "Save Session" },
    },

    t = {
      name = "Telescope",
      c = { "<cmd>Telescope colorscheme<cr>", "Colors" },
      f = {
        name = "Find",
        b = { "<cmd>Telescope buffers<cr>", "Find Buffers" },
        c = { "<cmd>Telescope command_history<cr>", "List Commands That Were Executed" },
        e = { "<cmd>Telescope notify<cr>", "Notifications" },
        f = { "<cmd>Telescope find_files <cr>", "Find File" },
        g = { "<cmd>Telescope live_grep <cr>", "Live Grep" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help Tags" },
        q = { "<cmd>Telescope quickfix<cr>", "List Items In The Quikcfix List" },
        s = { "<cmd>Telescope grep_string<cr>", "Find String Under Cursor" },
      },
      r = { "<cmd>Telescope resume<cr>", "Resume" },
      t = {
        name = "Treesitter",
        t = { "<cmd>Telescope treesitter<cr>", "List Function names, variables, from Treesitter" },
      },
    },

    v = {
      name = "+Marks",
      b = { "<cmd>TrailBlazerTrackBack<cr>", "Track Back" },
      e = { "<cmd>TrailBlazerPeekMovePreviousUp<cr>", "Peek Move Previous Up" },
      j = { "<cmd>TrailBlazerMoveToNearest<cr>", "Move To Nearest" },
      l = { "<cmd>TrailBlazerNewTrailMark<cr>", "New Mark" },
      L = { "<cmd>TrailBlazerDeleteAllTrailMarks<cr>", "Delete All" },
      m = { "<cmd>TrailBlazerToggleTrailMarkList<cr>", "Toggle List" },
      n = { "<cmd>TrailBlazerPeekMoveNextDown<cr>", "Peek Move Next Down" },
      p = { "<cmd>TrailBlazerPasteAtLastTrailMark<cr>", "Paste At Last" },
      P = { "<cmd>TrailBlazerPasteAtAllTrailMarks<cr>", "Paste At All" },
      s = { "<cmd>TrailBlazerSetTrailMarkStackSortMode<cr>", "Set Stack Sort Mode" },
      t = { "<cmd>TrailBlazerTrailMarkSelectMode<cr>", "Set Select Mode" },
      ['.'] = { "<cmd>TrailBlazerSwitchNextTrailMarkStack<cr>", "Switch To Next Stack" },
      [','] = { "<cmd>TrailBlazerSwitchPreviousTrailMarkStack<cr>", "Switch To Previous Stack" },
    },

    w = { "<cmd>w<cr>", "Write" },

    z = {
      name = "Spelling",
      a = { "zg", "Add word" },
      f = { "1z=", "Use 1. correction" },
      l = { "<cmd>Telescope spell_suggest<cr>", "List corrections" },
      n = { "]s", "Next" },
      p = { "[s", "Previous" },
    },
  }

  require('which-key').register(mappings, opts)
  require('which-key').register(vmappings, vopts)
end

return M
