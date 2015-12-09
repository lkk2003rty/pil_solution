#!/usr/bin/env lua

present_1 = "<![CDATA[\n  Hello world\n]]>"
present_2 = [==[
<![CDATA[
  Hello world
]>
]==]

print("One Way")
print(present_1)
print("Another Way")
print(present_2)
