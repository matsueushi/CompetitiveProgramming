parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

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

function solve(n, m, us, vs)
    g = SccGraph(n)
    for (u, v) in zip(us, vs)
        add_dir_edge!(g, u, v)
    end
    group = scc(g)
    cidx = zeros(Int, n)
    leng = length(group)
    ngroup = zeros(Int, leng)
    for (i, edges) in enumerate(group)
        ngroup[i] = length(edges)
        for x in edges
            cidx[x] = i
        end
    end

    topg = [Int[] for _ in 1:leng]
    for (u, v) in zip(us, vs)
        cidx[v] == cidx[u] && continue
        push!(topg[cidx[v]], cidx[u])
    end

    mov = ngroup .> 1
    for i in leng:-1:1
        mov[i] || continue
        for w in topg[i]
            mov[w] = true
        end
    end

    res = 0
    for i in 1:leng
        mov[i] && (res += ngroup[i])
    end
    res
end

function main()
    n, m = parseints()
    us, vs = parsepoints(m)
    solve(n, m, us, vs) |> println
end

main()
