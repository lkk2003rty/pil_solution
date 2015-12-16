#!/usr/bin/env lua

function builder(n)
    local code = { "function stringrep_" .. n .."(s)",
                   'local r = "";'}
    if n > 0 then
        while n > 1 do
            if n % 2 ~= 0 then
                code[#code+1] = 'r = r .. s;'
            end
            code[#code+1] = 's = s .. s;'
            n = math.floor(n / 2)
        end
        code[#code+1] = 'r = r .. s;'
    end
    code[#code+1] = 'return r;'
    code[#code+1] = 'end'

    local idx = 0
    local len = #code

    local function reader()
        while idx < len do
            idx = idx + 1
            return code[idx]
        end
        return nil
    end

    return load(reader)
end

builder(10)()
print(stringrep_10('hehe'))
