#!/usr/bin/env lua

local set = require "set"
local a = set.new({1, 2, 3})
local b = set.new({2, 3, 4})
print(set.tostring(a))
print(set.tostring(set.union(a, b)))
print(set.tostring(set.intersection(a, b)))
