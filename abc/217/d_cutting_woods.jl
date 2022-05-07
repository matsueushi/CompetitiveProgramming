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

function solve(l, q, cs, xs)
    reverse!(cs)
    reverse!(xs)
    cuts = [0, l]
    for i in 1:q
        cs[i] == 1 && (push!(cuts, xs[i]))
    end
    sort!(cuts)
    ncuts = length(cuts)
    ds = DisjointSet(ncuts - 1)
    csize = diff(cuts)
    outs = Int[]
    for i in 1:q
        if cs[i] == 1
            ind = searchsortedfirst(cuts, xs[i])
            cind0 = find_root!(ds, ind - 1)
            cind1 = find_root!(ds, ind)
            newlen = csize[cind0] + csize[cind1]
            newind = union!(ds, cind0, cind1)
            csize[newind] = newlen
        else
            ind = searchsortedfirst(cuts, xs[i])
            cind = find_root!(ds, ind - 1)
            push!(outs, csize[cind])
        end
    end
    reverse(outs)
end

function main()
    l, q = parse.(Int, split(readline()))
    cs, xs = zeros(Int, q), zeros(Int, q)
    for i in 1:q
        cs[i], xs[i] = parse.(Int, split(readline()))
    end
    println(join(solve(l, q, cs, xs), "\n"))
end

main()
