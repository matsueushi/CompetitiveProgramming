parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end


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

function groups(d::DisjointSet)
    gs = [Set{Int}() for _ in 1:d.n]
    for i in 1:d.n
        r = find_root!(d, i)
        push!(gs[r], i)
    end
    Set(s for s in gs if length(s) > 0)
end

function solve(n, m, k, as, bs, cs, ds)
    dset = DisjointSet(n)
    for (a, b) in zip(as, bs)
        union!(dset, a, b)
    end
    gps = groups(dset)
    res = zeros(Int, n)
    for g in gps
        gn = length(g)
        for x in g
            res[x] = gn - 1
        end
    end
    for (a, b) in zip(as, bs)
        res[a] -= 1
        res[b] -= 1
    end
    for (c, d) in zip(cs, ds)
        !in_same_set(dset, c, d) && continue
        res[c] -= 1
        res[d] -= 1
    end
    res
end

function main()
    n, m, k = parseints()
    as, bs = parsepoints(m)
    cs, ds = parsepoints(k)
    join(solve(n, m, k, as, bs, cs, ds), " ") |> println
end

main()
