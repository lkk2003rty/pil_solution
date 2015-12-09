#!/usr/bin/env lua

function is_boolean(x)
    return x == true or x == false
end

print('nil is boolean type: ' .. tostring(is_boolean(nil)))
print('number is boolean type: ' .. tostring(is_boolean(123)))
print('string is boolean type: ' .. tostring(is_boolean('123')))
print('table is boolean type: ' .. tostring(is_boolean({})))
print('true is boolean type: ' .. tostring(is_boolean(true)))
print('false is boolean type: ' .. tostring(is_boolean(false)))
