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


function solve(n, m, q, es)
    sort!(es)
    dset = DisjointSet(n)
    used = falses(q)
    for k in 1:m+q
        c, t, i, a, b = es[k]
        same = in_same_set(dset, a, b)
        if t == 1
            if !same
                union!(dset, a, b)
            end
        else
            if !same
                used[i] = true
            end
        end
    end
    for u in used
        println(u ? "Yes" : "No")
    end
end

function main()
    n, m, q = parse.(Int, split(readline()))
    es = NTuple{5,Int}[]
    for i in 1:m
        a, b, c = parse.(Int, split(readline()))
        push!(es, (c, 1, i, a, b))
    end
    for j in 1:q
        u, v, w = parse.(Int, split(readline()))
        push!(es, (w, 2, j, u, v))
    end
    solve(n, m, q, es)
end

main()

