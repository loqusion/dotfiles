-- https://github.com/hrsh7th/nvim-cmp

local settings = require 'core.settings'

local M = {
  safe_requires = {
    'cmp',
    { 'cmp.types', 'types' },
    { 'cmp.utils.str', 'str' },
    'luasnip',
    'lspkind',
  },
}

function M.setup() end

function M.config()
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
      { name = 'buffer', keyword_length = 4 },
      { name = 'neorg' },
      { name = 'nvim_lua' },
      -- { name = 'cmp_tabnine' },
    }, {
      { name = 'npm', keyword_length = 4 },
    }),
    sorting = {
      comparators = {
        -- require 'cmp_tabnine.compare',
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
    window = {
      completion = {
        winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
        col_offset = -3,
        side_padding = 0,
      },
    },
    formatting = {
      fields = { 'kind', 'abbr', 'menu' },
      format = function(entry, vim_item)
        vim_item.abbr = M.get_abbr(vim_item, entry)
        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0

        local kind = M.lspkind.cmp_format { mode = 'symbol_text', with_text = false, maxwidth = 50 } (entry, vim_item)

        -- if false or entry.source.name == 'cmdline' then
        --   kind.kind = ''
        -- else
        local strings = vim.split(kind.kind, '%s', { trimempty = true })
        kind.kind = string.format(' %s ', strings[1])
        -- kind.menu = string.format('    (%s)', strings[2])
        -- end

        return kind
      end,
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
      ['<Up>'] = M.cmp.mapping {
        i = M.cmp.mapping.select_prev_item(),
        s = M.cmp.mapping.select_prev_item(),
        c = false,
      },
      ['<Down>'] = M.cmp.mapping {
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
        i = M.tab,
        s = M.tab,
        c = M.cmp.mapping.select_next_item(),
      },
      ['<S-Tab>'] = M.cmp.mapping {
        i = M.stab,
        s = M.stab,
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
    -- window = {
    --   completion = {
    --     winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,Search:None',
    --     col_offset = 0,
    --     side_padding = 0,
    --   },
    -- },
  })
end

function M.tab(fallback)
  if M.luasnip.expand_or_jumpable() then
    M.luasnip.expand_or_jump()
  else
    fallback()
  end
end

function M.stab(fallback)
  if M.luasnip.jumpable(-1) then
    M.luasnip.jump(-1)
  else
    fallback()
  end
end

function M.get_abbr(vim_item, entry)
  local word = entry:get_insert_text()
  if entry.completion_item.insertTextFormat == M.types.lsp.InsertTextFormat.Snippet then
    word = vim.lsp.util.parse_snippet(word)
  end
  word = M.str.oneline(word)

  -- concatenates the string
  local max = 50
  if string.len(word) >= max then
    local before = string.sub(word, 1, math.floor((max - 3) / 2))
    word = before .. '...'
  end

  if entry.completion_item.insertTextFormat == M.types.lsp.InsertTextFormat.Snippet
      and string.sub(vim_item.abbr, -1, -1) == '~'
  then
    word = word .. '~'
  end
  return word
end

function M.register_buffer_autocmds()
  local group = vim.api.nvim_create_augroup('cmp_custom', {})
  vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
      vim.o.showbreak = ''
    end,
    group = group,
  })
end

return M
