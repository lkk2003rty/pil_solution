#!/usr/bin/env lua

local N = 8 -- board size

-- check whether position (n,c) is free from attacks
local function isplaceok (a, n, c)
    -- for each queen already placed
    for i= 1, n-1 do
        if (a[i] == c) or           -- same column?
           (a[i] - i == c - n) or   -- same diagonal?
           (a[i] + i == c + n) then -- same diagonal?
            return false            -- place can be attacked
        end
    end
    -- no attacks; place is OK
    return true                     
end
                    
-- print a board
local function printsolution (a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

function combinations(arr)
    local function helper(idx)
        if idx == 1 then
            coroutine.yield(arr)
        else
            for i = 1, idx - 1 do
                arr[i], arr[idx] = arr[idx], arr[i]
                helper(idx - 1)
                arr[i], arr[idx] = arr[idx], arr[i]
            end
            helper(idx - 1)
        end
    end

    local co = coroutine.create(function()
        helper(N)
    end)

    return function()
        local code, res = coroutine.resume(co)
        return res
    end
end
                    
-- run the program
local legal = true
for layout in combinations({1, 2, 3, 4, 5, 6, 7, 8}) do
    legal = true
    for i = 1, N do
        if not isplaceok(layout, i, layout[i]) then
            legal = false
            break
        end
    end

    if legal then
        printsolution(layout)
    end
end

