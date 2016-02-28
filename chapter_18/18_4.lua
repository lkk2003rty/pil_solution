#!/usr/bin/env lua

-- copy from random.gauss in Python
do
    local gauss_next
    function gauss(mu, sigma)
        z = gauss_next
        gauss_next = nil
        if z == nil then
            local x2pi = math.pi * math.random()
            local g2rad = math.sqrt(-2.0 * math.log(1.0 - math.random()))
            z = math.cos(x2pi) * g2rad
            gauss_next = math.sin(x2pi) * g2rad
        end

        return mu + z * sigma
    end
end

for i = 1, 20 do
    print(gauss(0, 1))
end
