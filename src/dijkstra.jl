module DijkstraModule

export DijkstraEdge, DijkStraGraph, add_dir_edge!, add_undir_edge!, DijkstraResult, dijkstra

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

function add_dir_edge!(g::DijkStraGraph, s::Int, t::Int, cost::Int)
    push!(g.edges[s], DijkstraEdge(t, cost))
end

function add_undir_edge!(g::DijkStraGraph, s::Int, t::Int, cost::Int)
    add_dir_edge!(g, s, t, cost)
    add_dir_edge!(g, t, s, cost)
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

end