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
    return {dist = distance, to = to}
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

function printpath (path)
    for i = 1, #path do
        print(path[i])
    end
end

function find_shortest_path(graph, from, to)
    local dist = {[from.name] = 0}
    local prev = {}
    local path = {}
    local end_name = to.name
    -- Bellman–Ford
    -- relax
    for _ in pairs(graph) do
        for name, info in pairs(graph) do
            if dist[name] ~= nil then
                for _, val in ipairs(info.incident_set) do
                    if dist[val.to.name] == nil or dist[val.to.name] > dist[name] + val.dist then
                        dist[val.to.name] = dist[name] + val.dist
                        prev[val.to.name] = name
                    end
                end
            end
        end
    end

    -- check nagative weight cycles
    for name, info in pairs(graph) do
        for _, val in ipairs(info.incident_set) do
            if dist[name] + val.dist < dist[val.to.name] then
                error("Graph contains a negative-weight cycle")
            end
        end
    end

    -- compute path
    while end_name ~= from.name do
        table.insert(path, 1, end_name)
        end_name = prev[end_name]
    end
    table.insert(path, 1, from.name)
    return path
end

g = readgraph()
a = name2node(g, "a")
b = name2node(g, "b")
p = find_shortest_path(g, a, b)
if p then printpath(p) end

