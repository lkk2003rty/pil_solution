#!/usr/bin/env lua

function remove_first(first, ...)
    return ...
end

local result = remove_first() 
print("call with empty: " .. tostring(result))
io.write("call with args: ")
result = {remove_first(1, 2, 3, 4, 5)}
for i=1, #result do
    io.write(tostring(result[i]) .. ' ')
end
io.write("\n")
