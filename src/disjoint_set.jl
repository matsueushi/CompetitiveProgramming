module DisjointSetModule

"""
    DisjointSet(n::Int)
Construct an undirected graph with n vertices and no edges.

    union!(d::DisjointSet, a::Int, b::Int)
Add an edge (a, b) and return the root.

    find_root!(d::DisjointSet, a::Int)
Find the root element of the connected component containing `a`.

    in_same_set(d::DisjointSet, a::Int, b::Int)
Return whether `a` and `b` are in the same set.

    group_size(d::DisjointSet, a::Int)
Return the number of elements of the set containing `a`.
"""

export DisjointSet, find_root!, in_same_set, group_size


struct DisjointSet
    par_or_size::Vector{Int} # root node : -1 * component size
    n::Int
end


DisjointSet(n::Int) = DisjointSet(fill(-1, n), n)

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

function find_root!(d::DisjointSet, a::Int)
    1 ≤ a ≤ d.n || throw(BoundsError())
    d.par_or_size[a] < 0 && return a
    d.par_or_size[a] = find_root!(d, d.par_or_size[a])
end

in_same_set(d::DisjointSet, a::Int, b::Int) = find_root!(d, a) == find_root!(d, b)

group_size(d::DisjointSet, a::Int) = -d.par_or_size[find_root!(d, a)]

end
