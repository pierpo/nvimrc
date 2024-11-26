local cmp = require "cmp"

local COMPLETION_KIND = require("const.LSP_KIND").Completion
require("sugar.highlight").colorscheme(function(h)
  local base = h.bg("Pmenu", { "NormalFloat", "Normal" })
  for kind, _ in pairs(COMPLETION_KIND) do
    local inherit = ("CmpItemKind%s"):format(kind)
    local group = ("%sIcon"):format(inherit)
    local fallback = { ("@%s"):format(kind:lower()), "CmpItemKindDefault" }
    local bg = h.blend(h.fg(inherit, fallback), base, 0.15)
    h.set(group, { inherit = inherit, bg = bg })
  end
end)

local config = {}
local formatting = {}
formatting.fields = { "kind", "abbr", "menu" }
formatting.format = function(entry, item)
  local kind = item.kind
  local kind_hl_group = ("CmpItemKind%s"):format(kind)

  item.kind_hl_group = ("%sIcon"):format(kind_hl_group)
  item.kind = (" %s "):format(COMPLETION_KIND[kind].icon)

  local source = entry.source.name
  if source == "nvim_lsp" or source == "path" then
    item.menu_hl_group = kind_hl_group
  else
    item.menu_hl_group = "Comment"
  end
  item.menu = kind

  if source == "buffer" then
    item.menu_hl_group = nil
    item.menu = nil
  end

  local half_win_width = math.floor(vim.api.nvim_win_get_width(0) * 0.5)
  if vim.api.nvim_strwidth(item.abbr) > half_win_width then
    item.abbr = ("%s…"):format(item.abbr:sub(1, half_win_width))
  end

  if item.menu then -- Add exta space to visually differentiate `abbr` and `menu`
    item.abbr = ("%s "):format(item.abbr)
  end

  return item
end

config.formatting = formatting

config.snippet = {
  expand = function(args)
    require("luasnip").lsp_expand(args.body)
  end,
}

config.sources = {
  { name = "nvim_lsp" },
  { name = "nvim_lua" },
  { name = "buffer" },
  { name = "path" },
  { name = "luasnip" },
}

config.window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
}

config.mapping = cmp.mapping.preset.insert {
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm { select = true },
}

config.completion = {
  completeopt = "menu,menuone,noinsert",
}

cmp.setup(config)

cmp.setup.cmdline {
  mapping = cmp.mapping.preset.cmdline {
    -- Your configuration here.
  },
}

-- local lspkind = require "lspkind"
-- cmp.setup {
--   formatting = {
--     format = lspkind.cmp_format { with_text = true, maxwidth = 50 },  },
-- }
