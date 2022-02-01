function path_lengths(start, graph)
    d = 0
    targets = Set([start])
    seen = Dict{Int64,Int64}()
    while length(seen) < n
        new_targets = Set{Int64}()
        for tg in targets
            seen[tg] = d
            for ed in graph[tg]
                haskey(seen, ed) || push!(new_targets, ed)
            end
        end
        targets = new_targets
        d += 1
    end
    seen
end

function circ_roads(n, roads)
    graph = [Set{Int64}() for _ in 1:n]
    for (st, en) in roads
        push!(graph[st], en)
        push!(graph[en], st)
    end
    dists = path_lengths(1, graph)
    start = argmax(dists)
    dists = path_lengths(start, graph)
    max_dist, _ = findmax(dists)
    max_dist + 1
end

function main()
    n = parse(Int64, readline())
    lines = readlines()
    roads = [parse.(Int64, split(x)) for x in lines[1:n-1]]
    println(circ_roads(n, roads))
end

main()
