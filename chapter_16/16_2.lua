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

StackQueue = Stack:new{bottom=0}

function StackQueue:insertbottom(elem)
    self[self.bottom] = elem
    self.bottom = self.bottom - 1
end

function StackQueue:isempty()
    return self.bottom == 0 and self.len == 1
end

function StackQueue:pop()
    local elem = self[self.len-1]
    self.len = self.len - 1
    self[self.len] = nil
    if self.len == self.bottom + 1 then
        self.len = 1
        self.bottom = 0
    end

    return elem
end

local s = StackQueue:new()
s:push(123)
print(s:top())
print(s:isempty())
s:insertbottom(456)
s:pop()
print(s:top())
s:pop()
print(s:isempty())

