struct BridgeGraph
    n::Int
    edges::Vector{Vector{Int}}
end

BridgeGraph(n::Int) = BridgeGraph(n, [Int[] for _ in 1:n])

function add_dir_edge!(g::BridgeGraph, s::Int, t::Int)
    push!(g.edges[s], t)
end

function add_undir_edge!(g::BridgeGraph, s::Int, t::Int)
    add_dir_edge!(g, s, t)
    add_dir_edge!(g, t, s)
end

function dfs!(g::BridgeGraph, res::Set{Pair{Int,Int}}, s::Int, t::Int, ind::Int, low::Vector{Int}, pre::Vector{Int})
    ind += 1
    pre[t] = ind
    low[t] = pre[t]
    for v in g.edges[t]
        v == s && continue
        if pre[v] == 0
            # not visited
            ind, l = dfs!(g, res, t, v, ind, low, pre)
            low[t] = min(low[t], l)
            low[v] == pre[v] && (push!(res, t => v))
        else
            low[t] = min(low[t], low[v])
        end
    end
    ind, low[t]
end

function find_bridges(g::BridgeGraph, s::Int)
    n = g.n
    low = zeros(Int, n)
    pre = zeros(Int, n)
    ind = 0
    res = Set{Pair{Int,Int}}()
    dfs!(g, res, -1, s, ind, low, pre)
    res
end
