local E, S, M = unpack(select(2, ...))
-----------------------------------------------------------------------
-- Test Helper
-----------------------------------------------------------------------
--[[ Really really simple testing framework ]]

E.Test = {
  ['passing'] = 0,
  ['failing'] = 0,
}

-- Increments either a failing count or a passing count
function E.Test:Assert(bool)
  if bool then
    self.passing = self.passing + 1
  else
    self.failing = self.failing + 1
    print(self.failing+self.passing.." failed")
  end
end

-- Increments either a failing count or a passing count
function E.Test:Deny(bool)
  E.Test:Assert(not bool)
end

-- Prints a report of all the tests run so far.
function E.Test:Report()
  print("EUI TESTS : "..self.failing.." failing, "..self.passing.." passing")
  if self.failing == 0 then
    print("All Tests passing!")
  else
    print("Tests failing")
  end
end
