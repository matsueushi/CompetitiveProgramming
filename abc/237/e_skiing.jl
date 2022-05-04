using DataStructures

struct Edge
    to::Int
    cost::Int
end

const P = NTuple{2,Int}

function dijkstra(s::Int, n::Int, graph::Vector{Vector{Edge}})
    d = fill(typemax(Int), n)
    d[s] = 0
    pq = PriorityQueue{P,Int}()
    enqueue!(pq, (0, s) => 0)

    while !isempty(pq)
        dist, ind = dequeue!(pq)
        d[ind] < dist && continue
        for e in graph[ind]
            if d[e.to] > d[ind] + e.cost
                d[e.to] = d[ind] + e.cost
                enqueue!(pq, (d[e.to], e.to) => d[e.to])
            end
        end
    end
    d
end

function solve(n, m, hs, us, vs)
    es = [Edge[] for _ in 1:n]
    # edges
    for i in 1:m
        x, y = us[i], vs[i]
        hx, hy = hs[x], hs[y]
        if hx == hy
            push!(es[x], Edge(y, 0))
            push!(es[y], Edge(x, 0))
        elseif hx > hy
            push!(es[x], Edge(y, 0))
            push!(es[y], Edge(x, hx - hy))
        else
            push!(es[x], Edge(y, hy - hx))
            push!(es[y], Edge(x, 0))
        end
    end
    d = dijkstra(1, n, es)
    maximum(hs[1] .- (d .+ hs))
end

function main()
    n, m = parse.(Int, split(readline()))
    hs = parse.(Int, split(readline()))
    us, vs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        us[i], vs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, hs, us, vs))
end

main()
