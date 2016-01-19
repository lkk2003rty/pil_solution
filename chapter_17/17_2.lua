#!/usr/bin/env lua

local object = {}
setmetatable(object, {__gc = function (o)
                                 print("Finalizing object: ", o)
                             end})

-- collected
-- object = nil

-- collected
-- error("Forced error")

-- not collect
-- os.exit()
