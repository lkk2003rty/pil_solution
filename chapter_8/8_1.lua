#!/usr/bin/env lua

function loadwithprefix(prefix, chunk)
    local first_time = true
    local all_done = false
    local function reader()
        if first_time then
            first_time = false
            return prefix
        else
            if all_done then
                return nil
            else
                all_done = true
                if type(chunk) == "function" then
                    return chunk()
                else
                    return chunk
                end
            end
        end
    end

    return load(reader)
end

print("test with string")
fun = loadwithprefix("i=1", "i=i*2;print(i)")
fun()

print("test with function")
function test()
    return "i = i * 3;print(i)"
end
fun = loadwithprefix("i=5", test)
fun()

