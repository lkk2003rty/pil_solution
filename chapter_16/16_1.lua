#!/usr/bin/env lua

Stack = {len=1}

function Stack:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Stack:push(elem)
    self[self.len] = elem
    self.len = self.len + 1
end

function Stack:pop()
    local elem = self[self.len-1]
    self.len = self.len - 1
    self[self.len] = nil
    return elem
end

function Stack:top()
    return self[self.len - 1]
end

function Stack:isempty()
    return self.len == 1
end

local s = Stack:new()
s:push(123)
print(s:top())
print(s:isempty())
s:pop()
print(s:isempty())

