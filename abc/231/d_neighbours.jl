struct DisjointSet
    par_or_size::Vector{Int} # root node : -1 * component size
    n::Int
end

"""
    DisjointSet(n::Int)
Construct an undirected graph with n vertices and no edges.
"""
DisjointSet(n::Int) = DisjointSet(fill(-1, n), n)

"""
    union!(d::DisjointSet, a::Int, b::Int)
Add an edge (a, b) and return the root.
"""
function Base.union!(d::DisjointSet, a::Int, b::Int)
    (1 ≤ a ≤ d.n && 1 ≤ b ≤ d.n) || throw(BoundsError())
    x = find_root!(d, a)
    y = find_root!(d, b)
    x == y && return x
    if -d.par_or_size[x] < -d.par_or_size[x]
        x, y = y, x
    end
    d.par_or_size[x] += d.par_or_size[y]
    d.par_or_size[y] = x
    x
end

"""
    find_root!(d::DisjointSet, a::Int)
Find the root element of the connected component containing `a`.
"""
function find_root!(d::DisjointSet, a::Int)
    1 ≤ a ≤ d.n || throw(BoundsError())
    d.par_or_size[a] < 0 && return a
    d.par_or_size[a] = find_root!(d, d.par_or_size[a])
end

"""
    in_same_set(d::DisjointSet, a::Int, b::Int)
Return whether `a` and `b` are in the same set.
"""
in_same_set(d::DisjointSet, a::Int, b::Int) = find_root!(d, a) == find_root!(d, b)

"""
    group_size(d::DisjointSet, a::Int)
Return the number of elements of the set containing `a`.
"""
group_size(d::DisjointSet, a::Int) = -d.par_or_size[find_root!(d, a)]

function solve(n, m, as, bs)
    graph = [Int[] for i in 1:n]
    for i in 1:m
        push!(graph[as[i]], bs[i])
        push!(graph[bs[i]], as[i])
    end
    for i in 1:n
        length(graph[i]) > 2 && return false
    end
    dset = DisjointSet(n)
    for i in 1:m
        in_same_set(dset, as[i], bs[i]) && return false
        union!(dset, as[i], bs[i])
    end
    true
end

function main()
    n, m = parse.(Int, split(readline()))
    as = zeros(Int, m)
    bs = zero(as)
    for i in 1:m
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, as, bs) ? "Yes" : "No")
end

main()
