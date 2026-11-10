-- Dream Theme base colors are shared with Vim; Neovim adds structural/semantic roles.
-- Named user-* so it loads after theme.lua (alphabetical), so it overrides Omarchy's colorscheme.
-- Delete this file to go back to following the Omarchy theme.
--
-- Other legacy Vim colorschemes keep their existing compatibility behavior:
--   * regex syntax instead of Tree-sitter / LSP semantic tokens
--   * Vim's legacy defaults (colors/vim.lua) for groups the scheme leaves unset, instead of Neovim's
--   * keep Omarchy's transparent background (transparency.lua), also when switching schemes by hand
local vim_schemes = {
  dreamThemeArc = true,
  monokai = true,
  ["vim-monokai-tasty"] = true,
}

local function active()
  return vim_schemes[vim.g.colors_name] == true
end

local function use_regex_syntax(buf)
  if vim.treesitter.highlighter.active[buf] then
    vim.treesitter.stop(buf)
    vim.bo[buf].syntax = vim.bo[buf].filetype
  end
end

local function use_treesitter(buf)
  if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_buf_is_loaded(buf) or vim.bo[buf].filetype == "" then return end
  local ok = vim.treesitter.highlighter.active[buf] ~= nil
  if not ok then ok = pcall(vim.treesitter.start, buf) end
  -- Unsupported languages keep syntax highlighting instead of becoming plain text.
  vim.bo[buf].syntax = ok and "" or vim.bo[buf].filetype
end

local function dream_highlights()
  local function hi(name, value) vim.api.nvim_set_hl(0, name, value) end
  local function link(name, target) hi(name, { link = target }) end
  if vim.o.background == "dark" then
    -- Preserve the Vim source; refine these roles only in Neovim.
    for _, name in ipairs({ "Number", "Float", "Constant" }) do hi(name, { fg = "#F0C840" }) end
    hi("Type", { fg = "#40E0D0" })
    for _, name in ipairs({ "Identifier", "Operator", "Delimiter" }) do hi(name, { fg = "#E5E5EA" }) end
    hi("Boolean", { fg = "#BA55D3" })
  end
  local captures = {
    variable="Identifier", ["variable.builtin"]="Identifier", ["variable.parameter"]="Identifier", ["variable.member"]="Identifier",
    constant="Constant", ["constant.builtin"]="Constant", ["constant.macro"]="Constant",
    module="Type", label="Statement", string="String", ["string.documentation"]="String",
    ["string.regexp"]="String", ["string.escape"]="Special", ["string.special"]="Special",
    character="Character", boolean="Boolean", number="Number", ["number.float"]="Float",
    type="Type", attribute="PreProc", property="Identifier", ["function"]="Function",
    ["function.builtin"]="Function", ["function.call"]="Function", ["function.method"]="Function",
    ["function.method.call"]="Function", ["function.macro"]="PreProc", constructor="Type",
    operator="Operator", keyword="Statement", ["keyword.operator"]="Statement", ["keyword.import"]="PreProc",
    ["punctuation.delimiter"]="Delimiter", ["punctuation.bracket"]="Delimiter", ["punctuation.special"]="Special",
    comment="Comment", ["comment.error"]="DiagnosticError", ["comment.warning"]="DiagnosticWarn",
    ["comment.todo"]="Todo", ["comment.note"]="DiagnosticInfo",
    ["markup.heading"]="Title", ["markup.link.url"]="Underlined", ["markup.raw"]="String",
    ["diff.plus"]="Added", ["diff.minus"]="Removed", ["diff.delta"]="Changed", tag="Tag",
    ["tag.attribute"]="Identifier", ["tag.delimiter"]="Delimiter",
  }
  for capture, target in pairs(captures) do link("@" .. capture, target) end
  -- Semantic modifiers layer above Tree-sitter. Clear inherited accent overrides,
  -- then supply all standard LSP token roles so provider defaults cannot recolor them.
  for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do hi(group, {}) end
  local tokens = {
    namespace="Type", type="Type", class="Type", enum="Type", interface="Type", struct="Type", typeParameter="Type",
    parameter="Identifier", variable="Identifier", property="Identifier", enumMember="Constant",
    event="Function", ["function"]="Function", method="Function", macro="PreProc", keyword="Statement",
    modifier="Statement", comment="Comment", string="String", number="Number", regexp="String",
    operator="Operator", decorator="PreProc", boolean="Boolean", builtinType="Type", selfParameter="Identifier",
  }
  for token, target in pairs(tokens) do link("@lsp.type." .. token, target) end
  hi("@lsp.mod.deprecated", { strikethrough = true })
  hi("@lsp.mod.readonly", { italic = true })
  hi("@markup.strong", { bold = true })
  hi("@markup.italic", { italic = true })
  hi("@markup.strikethrough", { strikethrough = true })
end

local applying = false
local function apply()
  local name = vim.g.colors_name
  if applying then
    return
  end
  if name == "dreamTheme" then
    dream_highlights()
    vim.lsp.semantic_tokens.enable(true)
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do use_treesitter(buf) end
    return
  end
  if not vim_schemes[name] then
    vim.lsp.semantic_tokens.enable(true)
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) then
        use_treesitter(buf)
      end
    end
    return
  end
  applying = true

  vim.cmd("highlight clear")
  local defaults = vim.api.nvim_get_hl(0, {})
  vim.cmd("runtime colors/vim.lua")
  local legacy = vim.api.nvim_get_hl(0, {})
  -- :colorscheme is a no-op while a ColorScheme autocmd runs, so source the file directly
  vim.cmd.source(vim.api.nvim_get_runtime_file("colors/" .. name .. ".vim", false)[1])
  for group, hl in pairs(legacy) do
    local current = vim.api.nvim_get_hl(0, { name = group, create = false })
    if vim.deep_equal(current, defaults[group]) then
      vim.api.nvim_set_hl(0, group, hl)
    end
  end

  vim.lsp.semantic_tokens.enable(false)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      use_regex_syntax(buf)
    end
  end
  local transparency = vim.fn.stdpath("config") .. "/plugin/after/transparency.lua"
  if vim.fn.filereadable(transparency) == 1 then
    vim.cmd.source(transparency)
  end
  applying = false
end

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dreamTheme",
    },
    init = function()
      local group = vim.api.nvim_create_augroup("user_vim_colorscheme", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", { group = group, callback = apply })
      -- LazyVim starts treesitter in its own FileType autocmd; stop it afterwards
      vim.api.nvim_create_autocmd("FileType", {
        group = group,
        callback = function(ev)
          if vim.g.colors_name == "dreamTheme" then
            vim.schedule(function()
              if vim.g.colors_name == "dreamTheme" then use_treesitter(ev.buf) end
            end)
          elseif active() then
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(ev.buf) then
                use_regex_syntax(ev.buf)
              end
            end)
          end
        end,
      })
    end,
  },
}
