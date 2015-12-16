#!/usr/bin/env lua

function multiload(...)
    local args = table.pack(...)
    local curr_idx = 1
    local curr_end = args.n
    local chunk = nil
    local ret = nil

    local function reader()
        while curr_idx <= curr_end do
            chunk = args[curr_idx]
            if type(chunk) == 'function' then
                ret = chunk()

                if ret ~= nil then
                    return ret
                else
                    curr_idx = curr_idx + 1
                end

            else
                curr_idx = curr_idx + 1
                return chunk
            end
        end

        return nil
    end

    return load(reader)
end

f = multiload("local x = 10",
              io.lines("temp", "*L"),
              " print(x)")

f()
