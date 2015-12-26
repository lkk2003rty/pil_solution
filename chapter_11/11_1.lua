#!/usr/bin/env lua

List = {}
function List.new ()
    return {first = 0, last = 0}
end

function List.pushfirst (list, value)
    local first = list.first - 1
    list.first = first
    list[first] = value
end

function List.pushlast (list, value)
    list[list.last] = value
    list.last = list.last + 1
end

function List.popfirst (list)
    if list.first == list.empty then
        error("empty queue")
    end

    local value = list[list.first]
    -- to allow garbage collection
    list[list.first] = nil
    list.first = list.first + 1
    return value
end

function List.poplast (list)
    if list.first == list.empty then
        error("empty queue")
    end
    local value = list[list.last-1]
    -- to allow garbage collection
    list[list.last-1] = nil
    list.last = list.last - 1
    return value
end

queue = List.new()
List.pushfirst(queue, ",")
List.pushlast(queue, "world")
List.pushlast(queue, "!")
List.pushfirst(queue, "Hello")

print(List.popfirst(queue))
print(List.poplast(queue))
print(List.popfirst(queue))
print(List.popfirst(queue))

