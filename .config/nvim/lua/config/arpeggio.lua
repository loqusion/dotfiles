local fn = vim.fn
local g = vim.g

fn['arpeggio#map']('i', '', 0, 'jk', '<Esc>')
g.arpeggio_timeoutlen = 60
