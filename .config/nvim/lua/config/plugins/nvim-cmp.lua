-- https://github.com/hrsh7th/nvim-cmp

local settings = require 'core.settings'

local M = {
  safe_requires = {
    'cmp',
    'luasnip',
    'lspkind',
  },
}

function M.setup() end

function M.config()
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
    snippet = {
      expand = function(args)
        M.luasnip.lsp_expand(args.body)
      end,
    },
    sources = M.cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
      { name = 'neorg' },
      { name = 'nvim_lua' },
      { name = 'cmp_tabnine' },
    }, {
      { name = 'npm', keyword_length = 4 },
    }),
    sorting = {
      comparators = {
        require 'cmp_tabnine.compare',
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
    formatting = {
      format = M.lspkind.cmp_format {
        mode = 'symbol',
        maxwidth = 50,
      },
    },
    mapping = {
      ['<CR>'] = M.cmp.mapping {
        i = M.cmp.mapping.confirm(),
        s = M.cmp.mapping.confirm(),
        c = false,
      },
      ['<C-p>'] = M.cmp.mapping {
        i = M.cmp.mapping.select_prev_item(),
        s = M.cmp.mapping.select_prev_item(),
        c = false,
      },
      ['<C-n>'] = M.cmp.mapping {
        i = M.cmp.mapping.select_next_item(),
        s = M.cmp.mapping.select_next_item(),
        c = false,
      },
      ['<C-b>'] = M.cmp.mapping(M.cmp.mapping.scroll_docs(-4), { 'i', 's', 'c' }),
      ['<C-f>'] = M.cmp.mapping(M.cmp.mapping.scroll_docs(4), { 'i', 's', 'c' }),
      ['<C-Space>'] = M.cmp.mapping.complete(),
      ['<C-e>'] = M.cmp.mapping {
        i = M.cmp.mapping.abort(),
        s = M.cmp.mapping.abort(),
        c = M.cmp.mapping.close(),
      },
      ['<C-y>'] = M.cmp.mapping(M.cmp.mapping.confirm { select = true }, { 'i', 's', 'c' }),
      ['<Tab>'] = M.cmp.mapping {
        i = tab,
        s = tab,
        c = M.cmp.mapping.select_next_item(),
      },
      ['<S-Tab>'] = M.cmp.mapping {
        i = stab,
        s = stab,
        c = M.cmp.mapping.select_prev_item(),
      },
    },
    experimental = {
      ghost_text = true,
    },
  }

  M.cmp.setup.filetype('gitcommit', {
    sources = M.cmp.config.sources({
      { name = 'cmp_git' },
    }, {
      { name = 'buffer' },
    }),
  })

  M.cmp.setup.cmdline('/', {
    sources = M.cmp.config.sources({
      { name = 'nvim_lsp_document_symbol' },
    }, {
      { name = 'buffer' },
    }),
  })

  M.cmp.setup.cmdline(':', {
    sources = M.cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })
end

return M
