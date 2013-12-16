local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- EUI Functions
-----------------------------------------------------------------------
--[[ These are EUI's utilities, they provide somewhat abstracted
     functionality. ]]

-- E:TableCopy : table -> table
-- Return a shallow copy of the given table.
function E:TableCopy(t)
  local copy = {}
  for k,v in pairs(t) do
    copy[k] = v
  end
  return copy
end

-- E:Round : number, number -> number
-- Rounding numbers, because sometimes 10.2135213 isn't helpful.
function E:Round(n, decimals)
  local mult = 10^(decimals or 0)
  return math.floor(n * mult + 0.5) / mult
end

-- E:HexToColor : string -> table
-- Converts hex colors to 0-1 colors.
function E.HexToColor(hex)
  local color = { }
  if strlen(hex) == 6 or strlength(hex) == 8 then
    for i = 1, 8, 2 do
      if strsub(hex, i, i+1) == "" then print(strsub(hex, i, i+1)) break end
      -- converting string to number 0-1
      tinsert(color, tonumber(strsub(hex, i, i+1), 16)/255)
    end
  else
    error(hex.." is not a valid hex color")
  end
  return unpack(color)
end

-- E:FormatTime : string -> string
-- Display seconds to min/hour/day.
function E.FormatTime(string)
  local day, hour, minute = 86400, 3600, 60
  if string >= day then
    return format("%dd", ceil(string / day))
  elseif string >= hour then
    return format("%dh", ceil(string / hour))
  elseif string >= minute then
    return format("%dm", ceil(string / minute))
  elseif string >= minute / 12 then
    return floor(string)
  end
  return '|cFFFF2222'..format("%.1f", string)..'|r'
end

-- TODO

-- -- merge the metatable of the given frame with the given metatable
-- function F.extend(frame, meta)
--   setmetatable(V.TMerge(getmetatable(frame), meta))
-- end

-- -- a timer, with callbacks
-- F.Timer = { }
-- function F.Timer.create(precision)
--   local self     = F.tcopy(F.Timer)
--   self.precision = (precision or 2)

--   -- the update frame
--   self.engine = CreateFrame('Frame')

--   return self
-- end
-- function F.Timer:remove()
--   self.engine:kill()
--   self = nil
-- end
-- function F.Timer:start( time_left, post_update, post_complete )
--   self.time_initial  = time_left
--   self.time_left     = time_left
--   self.post_update   = post_update
--   self.post_complete = post_complete

--   self.engine:SetScript('OnUpdate', function(engine, elapsed)
--     if self.time_left <= elapsed then
--       if post_update then self.post_update(0) end
--       if post_complete then self.post_complete() end
--       self.engine:SetScript('OnUpdate', nil)
--     else
--       if self.post_update then self.post_update(V.round(self.time_left, self.precision)) end
--     end
--     self.time_left = self.time_left - elapsed
--   end)
-- end
-- function F.Timer:reset()
--   self.time_left = self.time_initial
-- end