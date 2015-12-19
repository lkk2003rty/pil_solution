function markov_chain(prefix_len, max_gen)
    function allwords ()
        -- current line
        local line = io.read()
        -- current position in the line
        local pos = 1

        -- iterator function
        return function ()
            -- repeat while there are lines
            while line do
                local s, e = string.find(line, "%w+", pos)
                -- found a word?
                if s then
                    -- update next position
                    pos = e + 1
                    -- return the word
                    return string.sub(line, s, e)
                else
                    -- word not found; try next line
                    line = io.read()
                    -- restart from first position
                    pos = 1
                end
            end
            -- no more lines: end of traversal
            return nil
        end
    end

    function prefix (...)
        local ret = ""
        for i, v in ipairs({...}) do
            ret = ret .. v .. " "
        end 
        return ret
    end

    local statetab = {}
    function insert (index, value)
        local list = statetab[index]
        if list == nil then
            statetab[index] = {value}
        else
            list[#list + 1] = value
        end
    end

    local MAXGEN = 10000
    local NOWORD = "\n"
    -- build table
    local curr_stat = {}
    for i = 1, prefix_len do
        curr_stat[i] = NOWORD
    end

    for w in allwords() do
        insert(prefix(table.unpack(curr_stat)), w)
        for i = 1, prefix_len - 1 do
            curr_stat[i] = curr_stat[i + 1]
        end
        curr_stat[prefix_len] = w
    end

    insert(prefix(table.unpack(curr_stat)), NOWORD)

    -- generate text
    -- reinitialize
    for i = 1, prefix_len do
        curr_stat[i] = NOWORD
    end

    max_gen = max_gen or MAXGEN
    for i = 1, max_gen do
        local list = statetab[prefix(table.unpack(curr_stat))]
        -- choose a random item from list
        local r = math.random(#list)
        local nextword = list[r]
        if nextword == NOWORD then
            return
        end
        io.write(nextword, " ")
        for i = 1, prefix_len - 1 do
            curr_stat[i] = curr_stat[i + 1]
        end
        curr_stat[prefix_len] = nextword
    end
end

markov_chain(3)
