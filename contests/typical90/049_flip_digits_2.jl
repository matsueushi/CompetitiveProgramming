struct UnionFind
    par::Vector{Int64}
    rank::Vector{Int64}
end

UnionFind(n) = UnionFind(collect(1:n), zeros(Int64, n))

function find!(uf::UnionFind, x)
    1 ≤ x ≤ length(uf.par) || return nothing
    uf.par[x] == x && return x
    uf.par[x] = find!(uf, uf.par[x])
end

function unite!(uf::UnionFind, x, y)
    1 ≤ x ≤ length(uf.par) || return
    1 ≤ y ≤ length(uf.par) || return
    rx = find!(uf, x)
    ry = find!(uf, y)
    rx == ry && return
    if uf.rank[rx] < uf.rank[ry]
        uf.par[rx] = ry
    else
        uf.par[ry] = rx
        uf.rank[rx] == uf.rank[ry] && (uf.rank[rx] += 1)
    end
end

same!(uf, x, y) = find!(uf, x) == find!(uf, y)

function solve(n, m, cs, ls, rs)
    ix = sortperm(cs)
    cs = cs[ix]
    ls = ls[ix]
    rs = rs[ix]
    uf = UnionFind(n + 1) # 0 ~ n
    e = 0
    c = 0
    for i in 1:m
        same!(uf, ls[i], rs[i] + 1) && continue
        unite!(uf, ls[i], rs[i] + 1)
        c += cs[i]
        e += 1
        e == n && break
    end
    e < n ? -1 : c
end

function main()
    n, m = parse.(Int64, split(readline()))
    cs = zeros(Int64, m)
    ls = zeros(Int64, m)
    rs = zeros(Int64, m)
    for i in 1:m
        cs[i], ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, m, cs, ls, rs))
end

main()
