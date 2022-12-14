local gsd = require("gitsigns.debug")
local guv = require("gitsigns.uv")
local uv = vim.loop

local M = {JobSpec = {State = {}, }, }























M.job_cnt = 0

local function try_close(pipe)
   if pipe and not pipe:is_closing() then
      pipe:close()
   end
end

function M.run_job(obj, callback)
   if gsd.debug_mode then
      local cmd = obj.command .. ' ' .. table.concat(obj.args, ' ')
      gsd.dprint(cmd)
   end

   obj._state = {}
   local s = obj._state
   s.stdout_data = {}
   s.stderr_data = {}

   s.stdout = guv.new_pipe(false)
   s.stderr = guv.new_pipe(false)
   if obj.writer then
      s.stdin = guv.new_pipe(false)
   end

   s.handle, s.pid = guv.spawn(obj.command, {
      args = obj.args,
      stdio = { s.stdin, s.stdout, s.stderr },
      cwd = obj.cwd,
   },
   function(code, signal)
      s.handle:close()
      s.code = code
      s.signal = signal

      if s.stdout then s.stdout:read_stop() end
      if s.stderr then s.stderr:read_stop() end

      try_close(s.stdin)
      try_close(s.stdout)
      try_close(s.stderr)

      local stdout_result = #s.stdout_data > 0 and table.concat(s.stdout_data) or nil
      local stderr_result = #s.stderr_data > 0 and table.concat(s.stderr_data) or nil

      callback(code, signal, stdout_result, stderr_result)
   end)


   if not s.handle then
      try_close(s.stdin)
      try_close(s.stdout)
      try_close(s.stderr)
      error(debug.traceback("Failed to spawn process: " .. vim.inspect(obj)))
   end

   s.stdout:read_start(function(_, data)
      s.stdout_data[#s.stdout_data + 1] = data
   end)

   s.stderr:read_start(function(_, data)
      s.stderr_data[#s.stderr_data + 1] = data
   end)

   local writer = obj.writer
   if type(writer) == "table" then
      local writer_len = #writer
      for i, v in ipairs(writer) do
         s.stdin:write(v)
         if i ~= writer_len then
            s.stdin:write("\n")
         else
            s.stdin:write("\n", function()
               try_close(s.stdin)
            end)
         end
      end
   elseif writer then

      s.stdin:write(writer, function()
         try_close(s.stdin)
      end)
   end

   M.job_cnt = M.job_cnt + 1
   return obj
end

return M
