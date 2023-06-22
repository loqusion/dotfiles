_G.profile = function(cmd, times, flush)
  times = times or 100
  local start = vim.loop.hrtime()
  for _ = 1, times, 1 do
    if flush then
      jit.flush(cmd, true)
    end
    cmd()
  end
  print(((vim.loop.hrtime() - start) / 1000000 / times) .. "ms")
end

local M = {}

---@param name string
function M.augroup(name, prefix)
  prefix = vim.F.if_nil("prefix", "loqusion")
  local augroup_name = vim.fn.join({ prefix, name }, "_")
  return vim.api.nvim_create_augroup(augroup_name, { clear = false })
end

function M.is_ssh()
  return (vim.env.SSH_CLIENT or vim.env.SSH_TTY) ~= nil
end

---@param plugin string
function M.has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

function M.disable_autoformat(root_dir)
  root_dir = vim.F.if_nil(root_dir, vim.loop.cwd())
  vim.api.nvim_create_autocmd("BufReadPost", {
    group = M.augroup("disable_autoformat"),
    pattern = root_dir .. "*",
    callback = function(event)
      vim.b[event.buf].autoformat = false
      vim.b[event.buf].tidy_enabled = false
    end,
  })
end

function M.exists(fname)
  local stat = vim.loop.fs_stat(fname)
  return (stat and stat.type and true) or false
end

function M.escape_pattern(text)
  return text:gsub("([^%w])", "%%%1")
end

function M.fqn(fname)
  fname = vim.fn.fnamemodify(fname, ":p")
  return vim.loop.fs_realpath(fname) or fname
end

function M.runlua()
  local ns = vim.api.nvim_create_namespace("runlua")
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
    vim.diagnostic.reset(ns, buf)
  end

  local global = _G
  ---@type {lnum:number, col:number, message:string}[]
  local diagnostics = {}

  local function get_source()
    local info = debug.getinfo(3, "Sl")
    ---@diagnostic disable-next-line: param-type-mismatch
    local buf = vim.fn.bufload(info.source:sub(2))
    local row = info.currentline - 1
    return buf, row
  end

  local G = setmetatable({
    error = function(msg, level)
      local buf, row = get_source()
      diagnostics[#diagnostics + 1] = { lnum = row, col = 0, message = msg or "error" }
      vim.diagnostic.set(ns, buf, diagnostics)
      global.error(msg, level)
    end,
    print = function(...)
      local buf, row = get_source()
      local str = table.concat(
        vim.tbl_map(function(o)
          if type(o) == "table" then
            return vim.inspect(o)
          end
          return tostring(o)
        end, { ... }),
        " "
      )
      local indent = #(vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1]:match("^%s+") or {})
      local lines = vim.split(str, "\n")
      ---@param line string
      local virt_lines = vim.tbl_map(function(line)
        return { { string.rep(" ", indent * 2) .. " ", "DiagnosticInfo" }, { line, "MsgArea" } }
      end, lines)
      vim.api.nvim_buf_set_extmark(buf, ns, row, 0, { virt_lines = virt_lines })
    end,
  }, { __index = _G })
  require("lazy.core.util").try(loadfile(vim.api.nvim_buf_get_name(0), "bt", G))
end

function M.test(is_file)
  local file = is_file and vim.fn.expand("%:p") or "./tests"
  local init = vim.fn.glob("tests/*init*")
  require("plenary.test_harness").test_directory(file, { minimal_init = init, sequential = true })
end

function M.version()
  local v = vim.version()
  if v and not v.prerelease then
    vim.notify(
      ("Neovim v%d.%d.%d"):format(v.major, v.minor, v.patch),
      vim.log.levels.WARN,
      { title = "Neovim: not running nightly!" }
    )
  end
end

return M
