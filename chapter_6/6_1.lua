#!/usr/bin/env lua

function integral(fun, begin, finish, delta)
    local ret = 0
    for i = begin, finish, delta do
        ret = ret + delta * fun(i)
    end
    return ret
end

print(integral(function (x) return x ^ 2 + 1 end, 0, 1, 0.0001))
