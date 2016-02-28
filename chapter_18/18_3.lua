#!/usr/bin/env lua

-- https://en.wikipedia.org/wiki/Mersenne_Twister
do
    local index = 624
    local mt = {os.time()}

    function _int32(num)
        return 0xFFFFFFFF & num
    end

    -- init
    mt[0] = os.time()
    for i = 1, 623 do
        mt[i] = _int32(1812433253 * (mt[i - 1] ~ (mt[i - 1] >> 30)) + i)
    end

    function _twist()
        local y
        for i = 0, 623 do
            y = _int32((mt[i] & 0x80000000) + (mt[(i + 1)% 624] & 0x7fffffff))
            mt[i] = mt[(i + 397) % 624] ~ (y >> 1)

            if y % 2 ~= 0 then
                mt[i] = mt[i] ~ 0x9908b0df
            end
        end
        index = 0
    end

    function random()
        if index >= 624 then
            _twist()
        end
        local y = mt[index]

        -- Right shift by 11 bits
        y = y ~ (y >> 11)
        -- Shift y left by 7 and take the bitwise and of 2636928640
        y = y ~ ((y << 7) & 2636928640)
        -- Shift y left by 15 and take the bitwise and of y and 4022730752
        y = y ~ ((y << 15) & 4022730752)
        -- Right shift by 18 bits
        y = y ~ (y >> 18)

        index = index + 1

        return _int32(y)
    end

end

for i = 1, 20 do
    print(random())
end 

