#!/usr/bin/env lua

function getfield(f)
    if not string.match(f, '^[%w_%.]+[%w_]$') then
        error("Invalid field " .. f)
    end
    -- start with the table of globals
    local v = _G
    for w in string.gmatch(f, "([%a%d_]+)%.?") do
        if v[w] == nil then
            error("not exist field " .. w)
        end 
        v = v[w]
    end
    return v
end

a = { b=123}
print(getfield("a.b"))
print(getfield("a!c"))
