#!/usr/bin/env lua

function is_power_of_2(num)
    if num < 0 then
        return false
    end

    while true do
        if num < 2 then
            if num == 1 then
                return true
            else
                return false
            end
        end
        num = num / 2
    end
end

print(2.234, is_power_of_2(2.234))
print(1, is_power_of_2(1))
print(-1, is_power_of_2(-1))
print(1024, is_power_of_2(1024))
print(12.234, is_power_of_2(12.234))
