local path = require 'utils.api.path'
local key = require('crows').key

local function c_ctrl_k()
  vim.cmd [[exe 'normal! ' .. repeat("\<Del>", strchars(getcmdline()[getcmdpos() - 1:]))]]
end

local function ctrl_f()
  vim.cmd [[exe 'normal! ' .. max([winheight(0) - 2, 1]) .. "\<C-e>" .. (line('w$') >= line('$') ? 'L' : 'M')]]
end

local function ctrl_b()
  vim.cmd [[exe 'normal! ' .. max([winheight(0) - 2, 1]) .. "\<C-y>" .. (line('w0') <= 1 ? 'H' : 'M')]]
end

local function l()
  vim.cmd [[exe 'normal! ' .. (foldclosed(line('.')) != -1 ? (mode() == 'n' ? 'zo0' : 'zogv0') : 'l')]]
end

local mappings = {
  unmappings = { -- Unmappings
    q = { '<Nop>', 'which_key_ignore', mode = { 'n', 'x' } },
    ZZ = { '<Nop>', 'which_key_ignore' },
    ['<MiddleMouse>'] = { '<Nop>', 'which_key_ignore', mode = { 'n', 'x', 'o', 'i', 'l', 'c', 't' } },
  },
  normal = { -- Normal mode
    ['>'] = { '>>', 'Indent current line' },
    ['<'] = { '<<', 'Dedent current line' },
    -- ['*'] = { '*N', 'Highlight matches' },
    -- ['#'] = { '#N', 'Highlight matches' },
    ['#'] = { '<C-^>', 'Switch to alternate buffer' },
    -- ['g*'] = { 'g*N', 'Highlight matches' },
    -- ['g#'] = { 'g#N', 'Highlight matches' },
    x = { '"_x', 'Delete character below cursor' },
    X = { '"_X', 'Delete character before cursor' },
    l = { l, 'which_key_ignore' },
    Q = { 'q', 'Start recording macro' },
    M = { 'm', 'Set mark' },
    ['<C-c>'] = { '<silent> <C-c>', '' },
    gV = { 'v`[o`]', 'Select previously inserted/yanked text' },
    ['<C-f>'] = { ctrl_f, 'Scroll down one page' },
    ['<C-b>'] = { ctrl_b, 'Scroll up one page' },
    ['<C-h>'] = { '<C-w>h', 'Move to left window' },
    ['<C-j>'] = { '<C-w>j', 'Move to below window' },
    ['<C-k>'] = { '<C-w>k', 'Move to above window' },
    ['<C-l>'] = { '<C-w>l', 'Move to right window' },
    ['<leader>'] = {
      ['<leader>'] = { '<Cmd>silent update<CR>', 'Write (if modified)' },
      q = { '<Cmd>qall<CR>', 'Exit Vim' },
      x = { '<Cmd>xit!<CR>', 'Write (if modified) and close window' },
    },
  },
  visual = { -- Visual mode
    ['>'] = { '>gv', 'Indent selection' },
    ['<'] = { '<gv', 'Dedent selection' },
    p = { 'P', 'Put without yank to unnamed register' },
  },
  insert = { -- Insert mode
    ['<C-w>'] = { '<C-g>u<C-w>', '' },
    ['<C-u>'] = { '<C-g>u<C-u>', '' },
    -- ['<C-k>'] = { '<C-o>D', '' },
    -- These can be done with <M-o> and <M-O>
    -- ['<C-CR>'] = { '<C-o>o', 'Begin new line below cursor' },
    -- ['<S-CR>'] = { '<C-o>O', 'Begin new line above cursor' },
  },
  command = { -- Command mode
    ['<C-b>'] = { '<Left>', '' },
    ['<C-f>'] = { '<Right>', '' },
    ['<M-b>'] = { '<S-Left>', '' },
    ['<M-f>'] = { '<S-Right>', '' },
    ['<C-a>'] = { '<Home>', '' },
    ['<C-e>'] = { '<End>', '' },
    ['<C-p>'] = { '<Up>', '' },
    ['<C-n>'] = { '<Down>', '' },
    ['<C-y>'] = { '<C-r>*', '' },
    ['<C-g>'] = { '<C-c>', '' },
    ['<C-d>'] = { '<Del>', '' },
    ['<C-k>'] = { c_ctrl_k, '' },
  },
}

key.maps(mappings.unmappings, {}, false)
key.maps(mappings.normal, {}, false)
key.maps(mappings.visual, { mode = 'x' }, false)
key.maps(mappings.insert, { mode = 'i', false })
key.maps(mappings.command, { mode = 'c' }, false)

---@return string
local function canonical_name(name)
  return string.match(name, '/([%w%-_]+).?')
end

---@param name string
local function get_config_path(name)
  local file_name = name:lower() .. '.lua'
  local config_path = path.join(vim.fn.stdpath 'config', 'lua/config/plugins', file_name)
  return config_path
end

local function goto_plugin_config()
  ---@diagnostic disable-next-line: missing-parameter
  local cfile = vim.fn.expand '<cfile>'
  local plugin_name = canonical_name(cfile) or cfile
  local config_path = get_config_path(plugin_name)
  if not path.is_exists(config_path) then
    vim.fn.writefile({
      '-- https://github.com/' .. cfile,
      '',
      'local M = {}',
      '',
      'function M.setup()',
      'end',
      '',
      'function M.config()',
      'end',
      '',
      'return M',
    }, config_path)
  end
  vim.cmd('e ' .. config_path)
end

key.map('Go to plugin config', 'n', 'gpc', goto_plugin_config)

return mappings
