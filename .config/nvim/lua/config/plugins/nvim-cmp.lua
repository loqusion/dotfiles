-- https://github.com/hrsh7th/nvim-cmp

local settings = require 'core.settings'

local M = {}

function M.setup() end

function M.config()
  local ok, m = pcall(require, 'cmp')
  if not ok then
    vim.notify(
      string.format('Failed to load config %s: %s', require('utils.api.path').current_filename(true), m),
      vim.log.levels.ERROR
    )
    return
  end

  M.cmp = m

  M.luasnip = require 'luasnip'
  M.lspkind = require 'lspkind'

  local function tab(fallback)
    if M.luasnip.expand_or_jumpable() then
      M.luasnip.expand_or_jump()
    else
      fallback()
    end
  end

  local function stab(fallback)
    if M.luasnip.jumpable(-1) then
      M.luasnip.jump(-1)
    else
      fallback()
    end
  end

  M.cmp.setup {
    completion = {
      completeopt = settings.opt.completeopt or 'menu,menuone,noselect',
    },
    sorting = {
      comparators = {
        M.cmp.config.compare.offset,
        M.cmp.config.compare.exact,
        M.cmp.config.compare.score,
        require('cmp-under-comparator').under,
        M.cmp.config.compare.kind,
        M.cmp.config.compare.sort_text,
        M.cmp.config.compare.length,
        M.cmp.config.compare.order,
      },
    },
    snippet = {
      expand = function(args)
        M.luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = M.lspkind.cmp_format {
        mode = 'symbol',
        maxwidth = 50,
      },
    },
    mapping = M.cmp.mapping.preset.insert {
      ['<C-d>'] = M.cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = M.cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = M.cmp.mapping.complete(),
      ['<C-e>'] = M.cmp.mapping {
        i = M.cmp.mapping.abort(),
        c = M.cmp.mapping.close(),
      },
      ['<C-y>'] = M.cmp.mapping {
        c = M.cmp.mapping.confirm { select = true },
      },
      ['<Tab>'] = M.cmp.mapping(tab, { 'i', 's' }),
      ['<S-Tab>'] = M.cmp.mapping(stab, { 'i', 's' }),
    },
    experimental = {
      ghost_text = true,
    },
    sources = M.cmp.config.sources({
      { name = 'npm', keyword_length = 4 },
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'nvim_lua' },
    }, {
      { name = 'path' },
      { name = 'buffer' },
    }),
  }

  M.cmp.setup.filetype('gitcommit', {
    sources = M.cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    }),
  })

  M.cmp.setup.cmdline('/', {
    mapping = M.cmp.mapping.preset.cmdline(),
    sources = M.cmp.config.sources({
      { name = 'nvim_lsp_document_symbol' },
    }, {
      { name = 'buffer' },
    }),
  })

  M.cmp.setup.cmdline(':', {
    mapping = M.cmp.mapping.preset.cmdline(),
    sources = M.cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })
end

return M
