#!/usr/bin/env lua

-- original table (created somewhere)
t = {}
-- keep a private access to the original table
local _t = t
-- create proxy
t = {}
-- create metatable
local mt = {
    __index = function (t, k)
        print("*access to element " .. tostring(k))
        -- access the original table
        return _t[k]
    end,
    __newindex = function (t, k, v)
        print("*update of element " .. tostring(k) ..
              " to " .. tostring(v))
        -- update original table
        _t[k] = v
    end,
    __pairs = function (t)
        return function (_, k)
            return _t[k]
        end
    end,
    __ipairs = function (t)
        local function iter(_, i)
            i = i + 1
            if _t[i] then
                return i, _t[i]
            end
        end
        return iter, _t, 0
    end

}

setmetatable(t, mt)

t = {"one", "two", "three"}

for k, v in ipairs(t) do
    print(k, v)
end
