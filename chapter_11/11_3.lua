#!/usr/bin/env lua

function name2node (graph, name)
    local node = graph[name]
    if not node then
        -- node does not exist; create a new one
        node = {name = name, incident_set = {}}
        graph[name] = node
    end

    return node
end

function name2arc(distance, to)
    return {label = label, to = to}
end

function readgraph ()
    local graph={}
    for line in io.lines() do
        -- split line in two names
        local namefrom, nameto, distance = string.match(line,"(%S+)%s+(%S+)%s(%d+)")
        -- findcorrespondingnodes
        local from = name2node(graph, namefrom)
        local to = name2node(graph,nameto)
        local arc = name2arc(distance, to)
        -- adds arc to the incident set of 'from'
        from.incident_set[#from.incident_set + 1] = arc
    end

    return graph
end

function findpath (graph, curr, to, path, visited)
    path = path or {}
    visited = visited or {}
    -- node already visited?
    if visited[curr] then
       -- no path here
        return nil
    end
    -- mark node as visited
    visited[curr] = true
    -- add it to path
    path[#path + 1] = curr
    -- final node?
    if curr == to then
      return path
    end
    -- try all adjacent nodes
    for _, arc in ipairs(curr.incident_set) do
        local node = arc.to
        local p = findpath(graph, arc.to, to, path, visited)
        if p then
            return p
        end
    end
    -- remove node from path
    path[#path] = nil
end

function printpath (path)
    for i = 1, #path do
        print(path[i].name)
    end
end

g = readgraph()
a = name2node(g, "a")
b = name2node(g, "b")
p = findpath(g, a, b)
if p then printpath(p) end

