#!/usr/bin/env lua

Account = {balance = 0}

function Account:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Account:deposit(v)
    self.balance = self.balance + v
end

function Account:withdraw(v)
    if v > self.balance then
        error "insufficient funds"
    end

    self.balance = self.balance - v
end

function Account:curr_balance()
    return self.balance
end

Proxy = {
    instances = {},
    mt = {
        __index = function(k, func)
            local ins = Proxy.instances[k]
            if not ins then
                error "not object found"
            end
            if type(ins[func]) ~= 'function' then
                error("not allowed to access " .. tostring(func))
            end

            return function(...)
                args = {...}
                
                for i = 1, #args do
                    args[i] = Proxy.instances[args[i]] or args[i]
                end

                return ins[func](table.unpack(args))
            end
        end,

        __newindex = function(t, k, v)
            error("not allowwed to set " .. tostring(k) .. " with value " .. tostring(v))
        end
    },
    wrap = function(ins)
        local proxy = {}
        Proxy.instances[proxy] = ins
        setmetatable(proxy, Proxy.mt)
        return proxy
    end
}

setmetatable(Proxy, {__mode="k"})

acc = Proxy.wrap(Account:new{balance=100})

acc:deposit(3)
acc:withdraw(10)
print(acc:curr_balance())
