#!/usr/bin/env lua

function helper(arr, path)
    if #arr == 0 then
        for i=1, #path - 1 do
            io.write(tostring(path[i]) .. ',')
        end
        io.write(tostring(path[#path]) .. '\n')
    else
        for i=1, #arr do
            path[#path+1] = arr[i]
            local todo = {}
            for j=1,i-1 do
                todo[#todo+1] = arr[j]
            end
            for j=i+1,#arr do
                todo[#todo+1] = arr[j]
            end
            helper(todo, path)
            path[#path] = nil
        end
    end
end

function permutations(arr)
    helper(arr, {})
end

function comb_helper(arr, cnt, path)
    if cnt == 0 then
        for i=1, #path - 1 do
            io.write(tostring(path[i]) .. ',')
        end
        io.write(tostring(path[#path]) .. '\n')
    else
        for i=1, #arr do
            path[#path+1] = arr[i]
            local todo = {}
            for j=i+1,#arr do
                todo[#todo+1] = arr[j]
            end
            comb_helper(todo, cnt-1, path)
            path[#path] = nil
        end
    end
end

function combinations(arr)
    for i=1,#arr do
        comb_helper(arr, i, {})
    end
end

print("Permutations:")
permutations({1, 2, 3, 4, 5})
print("Combinations:")
combinations({1, 2, 3, 4, 5})
