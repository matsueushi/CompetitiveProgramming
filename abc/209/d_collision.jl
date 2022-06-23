parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

import Base.==

struct LcaGraph
    n::Int
    edges::Vector{Vector{Int}}
end

LcaGraph(n::Int) = LcaGraph(n, [Int[] for _ in 1:n])

function add_dir_edge!(g::LcaGraph, s::Int, t::Int)
    push!(g.edges[s], t)
end

function add_undir_edge!(g::LcaGraph, s::Int, t::Int)
    add_dir_edge!(g, s, t)
    add_dir_edge!(g, t, s)
end

struct Lca
    ancestor::Matrix{Int}
    depth::Vector{Int}
    max_depth::Int
end

==(x::Lca, y::Lca) = x.ancestor == y.ancestor && x.depth == y.depth && x.max_depth == y.max_depth

function dfs!(lca::Lca, graph::LcaGraph, v::Int, par::Int, depth::Int)
    lca.ancestor[1, v] = par
    lca.depth[v] = depth
    for u in graph.edges[v]
        u == par && continue
        dfs!(lca, graph, u, v, depth + 1)
    end
end

function Lca(graph::LcaGraph, root::Int)
    n = graph.n
    max_depth = 1
    while 1 << max_depth < n
        max_depth += 1
    end

    ancestor = zeros(Int, max_depth, n)
    depth = zeros(Int, n)
    lca = Lca(ancestor, depth, max_depth)
    dfs!(lca, graph, root, 0, 1)

    for d in 1:lca.max_depth-1
        for v in 1:n
            if lca.ancestor[d, v] > 0
                lca.ancestor[d+1, v] = lca.ancestor[d, lca.ancestor[d, v]]
            else
                lca.ancestor[d+1, v] = 0
            end
        end
    end

    lca
end

function find_lca(lca::Lca, u::Int, v::Int)
    if lca.depth[u] > lca.depth[v]
        u, v = v, u
    end
    for k in 1:lca.max_depth
        if (lca.depth[v] - lca.depth[u]) >> (k - 1) & 1 != 0
            v = lca.ancestor[k, v]
        end
    end
    u == v && return u
    for k in lca.max_depth:-1:1
        lca.ancestor[k, u] == lca.ancestor[k, v] && continue
        u = lca.ancestor[k, u]
        v = lca.ancestor[k, v]
    end
    lca.ancestor[1, u]
end

function distance(lca::Lca, u::Int, v::Int)
    w = find_lca(lca, u, v)
    lca.depth[u] + lca.depth[v] - 2 * lca.depth[w]
end

function solve(n, q, as, bs, cs, ds)
    graph = LcaGraph(n)
    for (a, b) in zip(as, bs)
        add_undir_edge!(graph, a, b)
    end
    lca = Lca(graph, 1)
    res = falses(q)
    for i in 1:q
        iseven(distance(lca, cs[i], ds[i])) && (res[i] = true)
    end
    res
end

function main()
    n, q = parseints()
    as, bs = parsepoints(n - 1)
    cs, ds = parsepoints(q)
    res = solve(n, q, as, bs, cs, ds)
    for x in res
        ifelse(x, "Town", "Road") |> println
    end
end

main()
