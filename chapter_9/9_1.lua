#!/usr/bin/env lua

function combinations(arr, cnt)
    local function helper(idx, path, count)
        if count == 0 then
            coroutine.yield(path)
        else
            for i = idx, #arr do
                path[#path + 1] = arr[i]
                helper(i + 1, path, count - 1)
                path[#path] = nil
            end
        end
    end

    local co = coroutine.create(function()
        helper(1, {}, cnt)
    end)

    return function()
        local code, res = coroutine.resume(co)
        return res
    end
end

function printResult(a)
    for i = 1, #a do
        io.write(a[i], " ")
    end
    io.write("\n")
end

for c in combinations({"a", "b", "c"}, 2) do
    printResult(c)
end
