parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function dfs!(graph, xs, kthmax, f, t)
    vs = [xs[t]]
    for u in graph[t]
        u == f && continue
        dfs!(graph, xs, kthmax, t, u)
        append!(vs, kthmax[u, :])
    end
    ys = sort(collect(vs), rev=true)
    for i in 1:min(20, length(ys))
        kthmax[t, i] = ys[i]
    end
end

function solve(n, q, xs, as, bs, vs, ks)
    graph = [Int[] for _ in 1:n]
    for (a, b) in zip(as, bs)
        push!(graph[a], b)
        push!(graph[b], a)
    end
    kthmax = zeros(Int, n, 20)
    dfs!(graph, xs, kthmax, -1, 1)
    res = zeros(Int, q)
    for i in 1:q
        res[i] = kthmax[vs[i], ks[i]]
    end
    res
end

function main()
    n, q = parseints()
    xs = parseints()
    as, bs = parsepoints(n - 1)
    vs, ks = parsepoints(q)
    res = solve(n, q, xs, as, bs, vs, ks)
    for t in res
        println(t)
    end
end

main()
