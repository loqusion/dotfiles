-- https://github.com/willothy/flatten.nvim

local M = {
  safe_requires = {
    'flatten',
  },
}

local function toggle_term()
  require('toggleterm').toggle(0)
end

function M.setup() end

function M.config()
  M.flatten.setup {
    window = {
      open = 'alternate',
    },
    callbacks = {
      should_block = function(argv)
        -- Note that argv contains all the parts of the CLI command, including
        -- Neovim's path, commands, options and files.
        -- See: :help v:argv

        -- In this case, we would block if we find the `-b` flag
        -- This allows you to use `nvim -b file1` instead of `nvim --cmd 'let g:flatten_wait=1' file1`
        return vim.tbl_contains(argv, '-b')

        -- Alternatively, we can block if we find the diff-mode option
        -- return vim.tbl_contains(argv, "-d")
      end,
      post_open = function(bufnr, winnr, ft, is_blocking)
        if is_blocking then
          -- Hide the terminal while it's blocking
          toggle_term()
        else
          -- If it's a normal file, just switch to its window
          vim.api.nvim_set_current_win(winnr)
        end

        -- If the file is a git commit, create one-shot autocmd to delete its buffer on write
        -- If you just want the toggleable terminal integration, ignore this bit
        if ft == 'gitcommit' then
          vim.api.nvim_create_autocmd('BufWritePost', {
            buffer = bufnr,
            once = true,
            callback = function()
              -- This is a bit of a hack, but if you run bufdelete immediately
              -- the shell can occasionally freeze
              vim.defer_fn(function()
                vim.api.nvim_buf_delete(bufnr, {})
              end, 50)
            end,
          })
        end
      end,
      block_end = function()
        -- After blocking ends (for a git commit, etc), reopen the terminal
        toggle_term()
      end,
    },
  }
end

return M
