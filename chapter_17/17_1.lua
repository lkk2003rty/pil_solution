#!/usr/bin/env lua

function show(t)
    for key,val in pairs(t) do
        print('key', key, 'val', val)
        break
    end
end

local table = {}

setmetatable(table, {__mode = "k"})

local key = {key = true}

local value = {key = key}

local mt = {__gc = function(t)
                       print("call gc of object " .. tostring(t) .. " with key " .. tostring(t.key))
                    end
           }

table[key] = value
setmetatable(table, mt)
setmetatable(key, mt)
setmetatable(value, mt)

print("After initialization:")
print("key " .. tostring(key))
print("value " .. tostring(value))
print("table " .. tostring(table))
collectgarbage()
show(table)

print("Set key = nil:")
key = nil
collectgarbage()
show(table)

print("Set value = nil:")
key = value.key
value = nil
collectgarbage()
show(table)

print("Set both nil:")
key = nil
value = nil
collectgarbage()
show(table)

