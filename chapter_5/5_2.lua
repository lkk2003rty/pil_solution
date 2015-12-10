#!/usr/bin/env lua

function print_all(arg)
    for k, v in pairs(arg) do
        print(k .. ' -> ' .. tostring(v))
    end
end

print_all({from="Jacob", to="Ramon"})
print("-----------------")
print_all{host="127.0.0.1", port="22", username="admin", password="admin"}
