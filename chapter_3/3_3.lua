#!/usr/bin/env lua

function cal(coef, x)
    local ret = 0
    for i=1, #coef do
        ret = ret + coef[i] * x ^ (i-1)
    end
    return ret
end

print("Please input coefficients, separate by space")
input = io.read()
c={}
for item in string.gmatch(input, "%S+") do
    c[#c+1] = item
end
print("Please input x value")
x = io.read("*n")
print("compute result is " .. cal(c, x))
