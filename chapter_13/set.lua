#!/usr/bin/env lua

Set = {}
-- metatable for sets
local mt = {}

-- create a new set with the values of a given list
function Set.new (l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do set[v] = true end
    return set
end

function Set.union (a, b)
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end

function Set.intersection (a, b)
    local res = Set.new{}
    for k in pairs(a) do
      res[k] = b[k]
    end
    return res
end

-- presents a set as a string
function Set.tostring (set)
    local l = {}
    -- list to put all elements from the set
    for e in pairs(set) do
      l[#l + 1] = e
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

-- print a set
function Set.print (s)
  print(Set.tostring(s))
end

function Set.difference(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        if not b[k] then
             res[k] = true
        end
    end
    return res
end

function Set.length(a)
    local len = 0
    for k in pairs(a) do
        len = len + 1
    end
    return len
end

mt.__mul = Set.intersection
mt.__add = Set.union
mt.__tostring = Set.tostring
mt.__metatable = "not your business"
mt.__le = function (a, b)    -- set containment
    for k in pairs(a) do
        if not b[k] then return false end
    end
    return true
end

mt.__lt = function (a, b)
    return a <= b and not (b <= a)
end

mt.__eq = function (a, b)
    return a <= b and b <= a
end
mt.__sub = Set.difference
mt.__len = Set.length

a = Set.new{1, 2}
b = Set.new{2, 3, 4, 5}
print("a={1, 2}")
print("b={2, 3, 4, 5}")
io.write("a + b = ")
print(a + b)
io.write("a - b = ")
print(a - b)
print("a's length " .. tostring(#a))

