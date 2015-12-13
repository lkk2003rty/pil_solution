#!/usr/bin/env lua

function all_substr(src)
    local from = 1
    local to = 0
    local len = #src
    return function ()
        if to == len then
            to = from
            from = from + 1
        end
        if from > len then
            return nil
        else
            to = to + 1
            return string.sub(src, from, to)
        end
    end
end

print("all substring in string 'hello world'")
for s in all_substr("hello world") do
    print(s)
end

print("all substring in empty string ''")
for s in all_substr("") do
    print(s)
end
