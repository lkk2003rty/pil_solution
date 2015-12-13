#!/usr/bin/env lua

function fromto(n, m, step)
    local function iter(stat, curr)
        if stat.init then
            stat.init = false
        else
            curr = curr + stat.step
        end
        if curr > stat.max then
            return nil
        else
            return curr
        end
    end
    return iter, {max=m, step=step, init=true}, n - 1 
end

print("test fromto(1, 10, 2)....")
for i in fromto(1, 10, 2) do
    print(i)
end

