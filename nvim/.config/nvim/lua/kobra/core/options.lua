local global = require('kobra.core.global')

local function load_options()
  local global_local = {
    termguicolors = true;
    mouse = 'nv';
    encoding = 'utf-8';
    clipboard = 'unnamedplus';
    wildignorecase = true;
    wildignore = '.git/**,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**,**/plz-out/**';
    backup = false;
    writebackup = false;
    undofile = true;
    swapfile = false;
    undodir = global.cache_dir .. 'undo/';
    backupdir = global.cache_dir .. 'backup/';
    viewdir = global.cache_dir .. 'view/';
    spellfile = global.cache_dir .. 'spell/en.utf-8.add';
    history = 4000;
    backupskip     = '/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim';
    smarttab = true;
    smartindent = true;
    shiftround = true;
    lazyredraw     = true;
    timeout        = true;
    ttimeout       = true;
    timeoutlen     = 500;
    ttimeoutlen    = 10;
    updatetime     = 500;
    redrawtime     = 100;
    ignorecase     = true;
    smartcase      = true;
    incsearch      = true;
    wrapscan       = true;
    conceallevel = 0;
    hlsearch = true;
    showtabline = 2;
    splitbelow = true;
    splitright = true;
    expandtab = true;
    shiftwidth = 2;
    tabstop = 2;
    cursorline = true;
    number = true;
    relativenumber = true;
    numberwidth = 4;
    signcolumn = 'yes';
    wrap = false;
    linebreak = false;
    scrolloff = 8;
    sidescrolloff = 8;
  }

  for k, v in pairs(global_local) do
    vim.opt[k] = v
  end
end

load_options()
