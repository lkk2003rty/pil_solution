#!/usr/bin/env lua

function serialize (o, indent, prefix)
    indent = indent or 0
    prefix = prefix or false
    if type(o) == "number" then
        io.write(tostring(o))
    elseif type(o) == "boolean" then
        io.write(tostring(o))
    elseif type(o) == "string" then
        io.write(string.format("%q", o))
    elseif type(o) == "table" then
        if prefix then 
            io.write(string.rep(" ", indent))
        end
        io.write("{\n")
        local index = {}
        local empty = true
        local first = true
        for idx, val in ipairs(o) do
            if first then
                first = false
                io.write(string.rep(" ", indent + 2))
            end
            index[idx] = true
            serialize(val, indent + 2, true)
            io.write(", ")
            empty = false
        end
        if not empty then
            io.write("\n")
        end
        for k, v in pairs(o) do
            if not index[k] then 
                io.write(string.rep(" ", indent + 2))
                if string.match(k, "^[a-zA-Z_][a-zA-Z0-9_]*$") then
                    io.write(k, " = ")
                else
                    io.write(string.format("[%q] = ", k))
                end
                serialize(v, indent + 2)
                io.write(",\n")
            end
        end
        io.write(string.rep(" ", indent))
        io.write("}")
    else
        error("cannot serialize a " .. type(o))
    end
end

t = {"a", "b", "c", "d", 
        name = "this",
        age = 131.89,
        bday = {
                d=8,
                m=6,
                y=1995
               },
        ["a dude"] = true,
    }

serialize(t)

