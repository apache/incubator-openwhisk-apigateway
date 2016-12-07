-- Copyright (c) 2016 IBM. All rights reserved.
--
--   Permission is hereby granted, free of charge, to any person obtaining a
--   copy of this software and associated documentation files (the "Software"),
--   to deal in the Software without restriction, including without limitation
--   the rights to use, copy, modify, merge, publish, distribute, sublicense,
--   and/or sell copies of the Software, and to permit persons to whom the
--   Software is furnished to do so, subject to the following conditions:
--
--   The above copyright notice and this permission notice shall be included in
--   all copies or substantial portions of the Software.
--
--   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--   FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--   DEALINGS IN THE SOFTWARE.

--- @module logger
-- Module to handle logging in a single place
-- @author Cody Walker (cmwalker), Alex Song (songs)
local utils = require "lib/utils"

local _M = {}

--- Handle error stream
-- @param s String to write to error level of log stream
function _M.err(s)
  ngx.log(ngx.ERR, s)
end

--- Handle info logs
-- @param s String to write to info level of log stream
function _M.info(s)
  ngx.log(ngx.INFO, s)
end

--- Handle debug stream to stdout
-- @param s String to write to debug stream
function _M.debug(s)
  if s == nil then
    s = "nil"
  elseif type(s) == "table" then
    s = utils.serializeTable(s)
  elseif type(s) == "boolean" then
    s = (s == true) and "true" or "false"
  end
  os.execute("echo \"" .. s .. "\"")
end

return _M
