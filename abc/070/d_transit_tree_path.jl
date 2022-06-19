parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

struct Edge
    node::Int
    cost::Int
end

function dfs!(graph, dist, f, t, d)
    for e in graph[t]
        e.node == f && continue
        dist[e.node] = d + e.cost
        dfs!(graph, dist, t, e.node, d + e.cost)
    end
end

function solve(n, as, bs, cs, q, k, xs, ys)
    graph = [Edge[] for _ in 1:n]
    for i in 1:n-1
        a, b, c = as[i], bs[i], cs[i]
        push!(graph[a], Edge(b, c))
        push!(graph[b], Edge(a, c))
    end

    dist = zeros(Int, n)
    dfs!(graph, dist, -1, k, 0)
    res = zeros(Int, q)
    for i in 1:q
        res[i] = dist[xs[i]] + dist[ys[i]]
    end
    res
end

function main()
    n = parseint()
    as, bs, cs = zeros(Int, n - 1), zeros(Int, n - 1), zeros(Int, n - 1)
    for i in 1:n-1
        as[i], bs[i], cs[i] = parseints()
    end
    q, k = parseints()
    xs, ys = parsepoints(q)
    for d in solve(n, as, bs, cs, q, k, xs, ys)
        println(d)
    end
end

main()
