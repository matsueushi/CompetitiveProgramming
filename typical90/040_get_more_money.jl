const INF = typemax(Int64) ÷ 2

mutable struct Edge
    to::Int64
    cap::Int64
    rev::Int64
end

function dfs!(graph, used, v, t, f)
    v == t && return f
    used[v] = true
    for edge in graph[v]
        (used[edge.to] || edge.cap == 0) && continue
        d = dfs!(graph, used, edge.to, t, min(f, edge.cap))
        d == 0 && continue
        edge.cap -= d
        graph[edge.to][edge.rev].cap += d
        return d
    end
    0
end

function add_edge!(graph, from, to, cap)
    push!(graph[from], Edge(to, cap, length(graph[to]) + 1))
    push!(graph[to], Edge(from, 0, length(graph[from])))
end

function solve(n, w, xs, ks, cs)
    graph = [Edge[] for _ in 1:n+2] # n+1 : start, n+2: end
    for i in 1:n
        # reward
        add_edge!(graph, n + 1, i, xs[i])
        # cost
        add_edge!(graph, i, n + 2, w)
        # restriction
        for c in cs[i]
            add_edge!(graph, c, i, INF)
        end
    end
    flow = 0
    while true
        used = falses(n + 2)
        f = dfs!(graph, used, n + 1, n + 2, INF)
        f == 0 && break
        flow += f
    end
    sum(xs) - flow
end

function main()
    n, w = parse.(Int64, split(readline()))
    xs = parse.(Int64, split(readline()))
    ks = zeros(Int64, n)
    cs = Vector{Int64}[]
    for i in 1:n
        kc = parse.(Int64, split(readline()))
        ks[i] = kc[1]
        push!(cs, kc[2:end])
    end
    println(solve(n, w, xs, ks, cs))
end

main()
