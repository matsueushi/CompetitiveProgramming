struct SccGraph
    n::Int
    edges::Vector{Vector{Int}}
    rev_edges::Vector{Vector{Int}}
end

function SccGraph(n::Int)
    edges = [Int[] for _ in 1:n]
    rev_edges = [Int[] for _ in 1:n]
    SccGraph(n, edges, rev_edges)
end

function add_dir_edge!(g::SccGraph, s::Int, t::Int)
    push!(g.edges[s], t)
    push!(g.rev_edges[t], s)
end

function dfs!(g::SccGraph, used::BitVector, vs::Vector{Int}, v::Int)
    used[v] = true
    for u in g.edges[v]
        used[u] || dfs!(g, used, vs, u)
    end
    push!(vs, v)
end

function rdfs!(g::SccGraph, used::BitVector, comp::Vector{Int}, v::Int)
    used[v] = true
    push!(comp, v)
    for u in g.rev_edges[v]
        used[u] || rdfs!(g, used, comp, u)
    end
end

function scc(g::SccGraph)
    used = falses(g.n)
    # first dfs
    vs = Int[]
    for v in 1:g.n
        used[v] || dfs!(g, used, vs, v)
    end
    # second dfs
    fill!(used, false)
    group = Vector{Int}[]
    while !isempty(vs)
        v = pop!(vs)
        used[v] && continue
        comp = Int[]
        rdfs!(g, used, comp, v)
        push!(group, comp)
    end
    group
end