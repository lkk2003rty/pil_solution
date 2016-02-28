#!/usr/bin/env lua

function cone_volumn(height, angle, is_degree)
    if is_degree then
        angle = math.rad(angle)
    end

    local r = math.tan(angle) * height

    return (math.pi * (r ^ 2) * height) / 3
end

print(cone_volumn(10, 60, true))

