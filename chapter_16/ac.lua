Proxy = {
   proxy = {},

   mt = {
      __index = function (acc, func)
         print('ins ' .. tostring(acc))
         local account = Proxy.proxy[acc]

         if not account then error("No account") end
         print(acc)
         print(account)
         print(type(account[func]))
         if type(account[func]) ~= "function" then error("No access to fields") end
         print('end')
         return function(...)
            args = {...}
            
            for i = 1, #args do
                print(i)
                print(args[i])
                args[i] = Proxy.proxy[args[i]] or args[i]
            end

            return account[func](table.unpack(args))
        end
      end
   }, 

   doProxy = function (account)
      local p = {}
      Proxy.proxy[p] = account
      setmetatable(p, Proxy.mt)
      return p
   end
}

Account = {balance = 0}
function Account:new (o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   return o
end

function Account:deposit(v)
   self.balance = self.balance + v
end 

function Account:withdraw(v)
   if v > self.balance then error("insufficient funds") end
   self.balance = self.balance - v
end

function Account:current_balance()
   return self.balance
end

acc = Proxy.doProxy(Account:new())

acc:deposit(1000)
-- acc:withdraw(500)
-- print(acc:current_balance())
