local util = require('lspconfig/util')

local bin_name = require('kobra.config.lang.lsp.data').path .. '/bin/kotlin-language-server'
if vim.fn.has('win32') == 1 then
  bin_name = bin_name .. '.bat'
end

local root_files = {
  'settings.gradle',       -- Gradle (multi-project)
  'settings.gradle.kts',   -- Gradle (multi-project)
  'build.xml',             -- Ant
  'pom.xml',               -- Maven
}

local fallback_root_files = {
  'build.gradle',          -- Gradle
  'build.gradle.kts',      -- Gradle
}

return {
  cmd = {bin_name},
  root_dir = function(fname)
    return util.root_pattern(unpack(root_files))(fname) or
    util.root_pattern(unpack(fallback_root_files))(fname)
  end,
}
