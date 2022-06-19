using DataStructures

parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

struct Edge
    node::Int
    cost::Int
end

function solve(n, us, vs, ws)
    graph = [Edge[] for _ in 1:n]
    for (u, v, w) in zip(us, vs, ws)
        push!(graph[u], Edge(v, w))
        push!(graph[v], Edge(u, w))
    end

    que = Queue{Pair{Int,Int}}()
    colors = fill(-1, n)
    colors[1] = 0
    enqueue!(que, 1 => 0)
    while !isempty(que)
        v, c = dequeue!(que)
        for e in graph[v]
            colors[e.node] ≥ 0 && continue
            ec = nothing
            if iseven(e.cost)
                ec = c
            else
                ec = 1 - c
            end
            colors[e.node] = ec
            enqueue!(que, e.node => ec)
        end
    end
    colors
end

function main()
    n = parseint()
    us, vs, ws = zeros(Int, n - 1), zeros(Int, n - 1), zeros(Int, n - 1)
    for i in 1:n-1
        us[i], vs[i], ws[i] = parseints()
    end
    for c in solve(n, us, vs, ws)
        println(c)
    end
end

main()
