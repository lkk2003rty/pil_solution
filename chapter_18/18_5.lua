#!/usr/bin/env lua

function shuffle(list)
    math.randomseed(os.time())
    for i = #list, 2, -1 do
        j = math.random(i)
        list[i], list[j] = list[j], list[i]
    end
end

local l = { 1, 2, 3, 4, 5, 6, 7, 8}
print("before shuffle")
for i = 1, #l do
    io.write(tostring(l[i]) .. ' ')
end
io.write('\n')
shuffle(l)
print("after shuffle")
for i = 1, #l do
    io.write(tostring(l[i]) .. ' ')
end
io.write('\n')

