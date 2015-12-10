#!/usr/bin/env lua

function concat(...)
    local ret = ''
    for i, v in ipairs({...}) do
        if i == 1 then
            ret = tostring(v)
        else
            ret = ret .. ' ' .. tostring(v)
        end
    end
    return ret
end

print("concatenate nothing: " .. concat())
print("concatenate one string: " .. concat("one"))
print("concatenate some strings: " .. concat("one", "two", "three", "four"))

