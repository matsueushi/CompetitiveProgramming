using DataStructures

struct DijkstraEdge
    to::Int
    cost::Int
end

struct DijkstraResult
    cost::Vector{Int}
    prev::Vector{Int}
end

struct DistIndex
    distance::Int
    idx::Int
end

struct DijkStraGraph
    n::Int
    edges::Vector{Vector{DijkstraEdge}}
end

DijkStraGraph(n::Int) = DijkStraGraph(n, [DijkstraEdge[] for _ in 1:n])

function add_edge!(g::DijkStraGraph, s::Int, t::Int, cost::Int)
    push!(g.edges[s], DijkstraEdge(t, cost))
end

function dijkstra(g::DijkStraGraph, s::Int)
    n = g.n
    d = fill(typemax(Int), n)
    prev = fill(-1, n)
    d[s] = 0
    pq = PriorityQueue{DistIndex,Int}()
    enqueue!(pq, DistIndex(0, s) => 0)

    while !isempty(pq)
        distindex = dequeue!(pq)
        distance = distindex.distance
        ind = distindex.idx
        d[ind] < distance && continue
        for e in g.edges[ind]
            if d[e.to] > d[ind] + e.cost
                d[e.to] = d[ind] + e.cost
                prev[e.to] = ind
                enqueue!(pq, DistIndex(d[e.to], e.to) => d[e.to])
            end
        end
    end
    DijkstraResult(d, prev)
end


parseints() = parse.(Int, split(readline()))

function solve(n, m, as, bs, cs)
    edge_idx = Dict{NTuple{2,Int},Int}()
    g = DijkStraGraph(n)
    for i in 1:m
        add_edge!(g, as[i], bs[i], cs[i])
        add_edge!(g, bs[i], as[i], cs[i])
        edge_idx[(as[i], bs[i])] = i
        edge_idx[(bs[i], as[i])] = i
    end
    dijk = dijkstra(g, 1)
    res = Int[]
    for i in 2:n
        prev = dijk.prev[i]
        push!(res, edge_idx[(prev, i)])
    end
    res
end

function main()
    n, m = parseints()
    as = zeros(Int, m)
    bs = zeros(Int, m)
    cs = zeros(Int, m)
    for i in 1:m
        as[i], bs[i], cs[i] = parseints()
    end
    println(join(solve(n, m, as, bs, cs), " "))
end

main()