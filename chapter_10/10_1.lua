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
                    
-- add to board 'a' all queens from 'n' to 'N'
local function addqueen (a, n)
    -- all queens have been placed?
    if n > N then
        printsolution(a)
        return true
    else
        -- try to place n-th queen
        for c = 1, N do
            if isplaceok(a, n, c) then
                -- place n-th queen at column 'c'
                a[n] = c
                if addqueen(a, n + 1) then
                    return true
                end
            end
        end
        return false
    end
end
                    
-- run the program
addqueen({}, 1)

