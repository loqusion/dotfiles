---@type Feature
local completion = { plugins = {} }

completion.plugins[#completion.plugins + 1] = {
  'hrsh7th/nvim-cmp',
  requires = {
    -- Snippets
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    -- Completion engine sources
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }, -- LuaSnip
    { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }, -- LSP
    { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }, -- Buffer words
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' }, -- Filesystem paths
    { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }, -- Vim's cmdline
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }, -- Neovim's Lua API
    { 'David-Kunz/cmp-npm', after = 'nvim-cmp' }, -- NPM package names and versions
    { 'lukas-reineke/cmp-under-comparator', after = 'nvim-cmp' }, -- Better sorting for underscores
    { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' }, -- `textDocument/documentSymbol`
    { -- AI pair programmer
      'zbirenbaum/copilot-cmp',
      disable = true,
      requires = {
        -- 'github/copilot.vim', -- Use this for setup
        {
          'zbirenbaum/copilot.lua',
          disable = true,
          event = 'VimEnter',
          config = function()
            vim.defer_fn(function()
              require('copilot').setup()
            end, 100)
          end,
        },
      },
      after = { 'copilot.lua', 'nvim-cmp' },
    },
  },
  event = { 'InsertEnter *', 'CmdlineEnter', 'CmdwinEnter', 'CursorHold' },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    local lspkind = require 'lspkind'
    local function tab(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end
    function stab(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end

    cmp.setup {
      completion = {
        completeopt = 'menuone,noselect',
        -- completeopt = 'menu,menuone,noinsert',
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          require('cmp-under-comparator').under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      formatting = {
        format = lspkind.cmp_format {
          mode = 'symbol',
          maxwidth = 50,
        },
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(tab, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(stab, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'npm', keyword_length = 4 },
        --{ name = 'nvim_lsp_signature_help' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
      }, {
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
      }),
    }

    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' },
      }, {
        { name = 'buffer' },
      }),
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'nvim_lsp_document_symbol' },
      }, {
        { name = 'buffer' },
      }),
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,
}

completion.plugins[#completion.plugins + 1] = {
  'hrsh7th/cmp-nvim-lsp',
  config = function()
    require('crows.lsp').add_caps_setter(require('cmp_nvim_lsp').update_capabilities)
  end,
}

completion.plugins[#completion.plugins + 1] = {
  'David-Kunz/cmp-npm',
  config = function()
    require('cmp-npm').setup()
  end
}

return completion
