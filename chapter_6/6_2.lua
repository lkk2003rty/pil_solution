#!/usr/bin/env lua

function newpoly(coef)
    return function (x)
        local ret, curr = 0, 1
        for i = #coef, 1, -1 do
            ret = ret + coef[i] * curr 
            curr = curr * x
        end
        return ret
    end
end

f = newpoly({3, 0, 1})
print(f(0))
print(f(5))
print(f(10))
