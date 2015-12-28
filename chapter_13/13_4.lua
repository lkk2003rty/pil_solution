#!/usr/bin/env lua

-- create private index
local index = {}

-- create metatable
local mt = {
    __index = function (t, k)
        -- access the original table
        return t[index][k]
    end,
    __newindex = function (t, k, v)
        error("attempt to update a read-only table", 2)
    end
}

function readOnly (t)
    local proxy = {}
    proxy[index] = t
    setmetatable(proxy, mt)
    return proxy
end


days = readOnly{"Sunday", "Monday", "Tuesday", "Wednesday",
                "Thursday", "Friday", "Saturday"}
print(days[1])     --> Sunday
days[2] = "Noday"

