#!/usr/bin/env lua

function fromto(n, m)
    local function iter(stat, curr)
        curr = curr + 1
        if curr > stat then
            return nil
        else
            return curr
        end
    end
    return iter, m, n - 1 
end

print("test fromto(1, 10)....")
for i in fromto(1, 10) do
    print(i)
end

