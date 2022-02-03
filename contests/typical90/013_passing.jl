using DataStructures

function dijkstra(graph, start)
    n = length(graph)
    distance = fill(typemax(Int64), n)
    distance[start] = 0
    frontier = PriorityQueue(start => 0)

    pt = start
    while !isempty(frontier)
        x, cx = dequeue_pair!(frontier)
        edges = graph[x]

        for (node, cost) in edges
            xcost = cx + cost
            if distance[node] > xcost
                distance[node] = xcost
                frontier[node] = xcost
            end
        end
    end
    distance
end

function passing(n, as, bs, cs)
    graph = [Dict{Int64,Int64}() for _ in 1:n]
    for (a, b, c) in zip(as, bs, cs)
        push!(graph[a], b => c)
        push!(graph[b], a => c)
    end
    dijkstra(graph, 1) .+ dijkstra(graph, n)
end

function main()
    n, m = parse.(Int64, split(readline()))
    as = zeros(Int64, m)
    bs = zeros(Int64, m)
    cs = zeros(Int64, m)
    for i in 1:m
        as[i], bs[i], cs[i] = parse.(Int64, split(readline()))
    end
    println(join(passing(n, as, bs, cs), "\n"))
end

main()
