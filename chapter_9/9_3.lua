#!/usr/bin/env lua

local threads = {}

function transfer(name)
    if threads[name] == nil then
        error("the thread[" .. name .. "] doesn't exist")
    else
        coroutine.yield(name)
    end
end

function register(name, fun)
    threads[name] = coroutine.create(fun)
end

function run(name)
    local status, thread_name
    while name do
        if threads[name] == nil then
            error("the thread[" .. name .. "] doesn't exist")
        end
        status, thread_name = coroutine.resume(threads[name])
        if status == "dead" then
            threads[name] = nil
        end
        name = thread_name
    end
end

register('Charlie', function() 
    print("Hi, Lily.")
    transfer("Lily")
    print("Nice to meet you.")
end)

register('Lily', function() 
    print("Hi, Charlie, I wanna introduce my friend Lucia.")
    print("Lucia, this is Charlie. Charlie, Lucia.")
    transfer("Lucia")
end)

register('Lucia', function() 
    print("Hey, I'm Lucia. Nice to meet you.")
    transfer("Charlie")
end)

run("Charlie")
