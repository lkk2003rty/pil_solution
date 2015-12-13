#!/usr/bin/env lua

function uniquewords()
    local line = io.read()
    local pos = 1
    local words = {}
    return function ()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                local word = string.sub(line, s, e)
                if not words[word] then
                    words[word] = true
                    return word
                end
            else
                line = io.read()
                pos = 1
            end
        end
    end
end

for w in uniquewords() do
    print(w)
end
