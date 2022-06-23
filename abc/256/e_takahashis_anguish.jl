parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))


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

function solve(n, xs, cs)
    ds = DisjointSet(n)
    res = 0
    for i in 1:n
        if !in_same_set(ds, i, xs[i])
            union!(ds, i, xs[i])
            continue
        end
        v = i
        c = cs[i]
        while true
            v = xs[v]
            c = min(c, cs[v])
            v == i && break
        end
        res += c
    end
    res
end

function main()
    n = parseint()
    xs = parseints()
    cs = parseints()
    solve(n, xs, cs) |> println
end

main()
