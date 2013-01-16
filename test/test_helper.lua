local M, S, V, F = unpack(select(2, ...))
if not V.TEST then return end
-----------------------------------------------------------------------
-- Test Helper
-----------------------------------------------------------------------
--[[ Really really simple testing framework ]]

F.Test = {
  ['passing'] = 0,
  ['failing'] = 0,
}

-- F.Test.assert
-- Increments either a failing count or a passing count
function F.Test:assert(bool)
  if bool then
    self.passing = self.passing + 1
  else
    self.failing = self.failing + 1
    print(self.failing+self.passing.." failed")
  end
end

-- F.Test.deny
-- Increments either a failing count or a passing count
function F.Test:deny(bool)
  F.Test:assert(not bool)
end

-- F.Test:report
-- Prints a report of all the tests run so far.
function F.Test:report()
  print("EUI TESTS : "..self.failing.." failing, "..self.passing.." passing")
  if self.failing == 0 then
    print("All Tests passing!")
  else
    print("Tests failing")
  end
end