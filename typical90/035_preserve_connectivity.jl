struct Lca
    anc::Matrix{Int64}
    dist::Vector{Int64}
    ord::Vector{Int64}
    depth::Int64
    function Lca(graph::Vector{Vector{Int64}})
        n = length(graph)
        depth = 1
        while 1 << depth < n
            depth += 1
        end

        par = fill(-1, n)
        ord = zeros(Int64, n)
        dist = zeros(Int64, n)
        dfs!(graph, par, dist, ord, 1, 1, 0, 1)

        anc = zeros(Int64, depth, n)
        anc[1, :] = par
        for k in 1:depth-1
            for v in 1:n
                anc[k+1, v] = anc[k, anc[k, v]]
            end
        end

        new(anc, dist, ord, depth)
    end
end

function dfs!(
    graph::Vector{Vector{Int64}},
    par::Vector{Int64},
    dist::Vector{Int64},
    ord::Vector{Int64},
    v,
    p,
    d,
    n,
)
    par[v] = p
    dist[v] = d
    ord[v] = n
    for nv in graph[v]
        nv == p && continue
        n += 1
        n = dfs!(graph, par, dist, ord, nv, v, d + 1, n)
    end
    n
end

function lca(lc::Lca, u, v)
    if lc.dist[u] < lc.dist[v]
        u, v = v, u
    end
    for k in 1:lc.depth
        if (lc.dist[u] - lc.dist[v]) >> (k - 1) & 1 != 0
            u = lc.anc[k, u]
        end
    end

    u == v && return u
    for k in Iterators.reverse(1:lc.depth)
        lc.anc[k, u] == lc.anc[k, v] && continue
        u, v = lc.anc[k, u], lc.anc[k, v]
    end
    lc.anc[1, u]
end

function dist(lc::Lca, u, v)
    w = lca(lc, u, v)
    lc.dist[u] + lc.dist[v] - 2 * lc.dist[w]
end

function min_edge(lc::Lca, vs)
    ors = [lc.ord[v] for v in vs]
    ax = sortperm(ors)
    vs = vs[ax]
    ne = 0
    for i in 1:length(vs)-1
        ne += dist(lc, vs[i], vs[i+1])
    end
    ne += dist(lc, last(vs), first(vs))
    ne ÷ 2
end

function solve(n, xs, ys, ks, vss)
    graph = [Int64[] for _ in 1:n]
    for i in 1:n-1
        push!(graph[xs[i]], ys[i])
        push!(graph[ys[i]], xs[i])
    end
    lc = Lca(graph)
    for vs in vss
        println(min_edge(lc, vs))
    end
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n-1
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    q = parse(Int64, readline())
    ks = zeros(Int64, q)
    vss = Vector{Int64}[]
    for i in 1:q
        kvs = parse.(Int64, split(readline()))
        ks[i] = kvs[1]
        push!(vss, kvs[2:end])
    end
    solve(n, xs, ys, ks, vss)
end

main()
