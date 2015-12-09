#!/usr/bin/env lua
escape={
    ["\n"] = "line feed",
    ["\r"] = "carriage return",
    ["\t"] = "tab"
}

print("string is " .. escape["\n"])
