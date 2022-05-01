struct FenwickTree{T}
    data::Vector{T}
    n::Int
end

"""
    FenwickTree{T}(n::Int)
Construct a FenwickTree of length `n`.
"""
FenwickTree{T}(n::Int) where {T} = FenwickTree(zeros(T, n), n)

"""
    add!(fw::FenwickTree{T}, ind::Int, x)
Increase the value of the FenwickTree at p. `a[ind] += x`.
"""
function add!(fw::FenwickTree{T}, ind::Int, x) where {T}
    @boundscheck checkbounds(fw.data, ind)
    xt = convert(T, x)
    i = ind
    n = fw.n
    while i ≤ n
        @inbounds fw.data[i] += xt
        i += i & (-i)
    end
end

"""
    prefixsum(fw::FenwickTree{T}, r::Int)
"""
function prefixsum(fw::FenwickTree{T}, r::Int) where {T}
    s = zero(r)
    r < 1 && return s
    @boundscheck checkbounds(fw.data, r)
    i = r
    while i > 0
        @inbounds s += fw.data[i]
        i -= i & (-i)
    end
    s
end

"""
    partialsum(fw::FenwirkTree{T}, I::AbstractUnitRante{Int})
Return `a[l] + a[l + 1] + ... + a[r]` where l = `first(I)` and r = `last(I)`.
"""
function partialsum(fw::FenwickTree{T}, I::AbstractUnitRange{Int}) where {T}
    l, r = first(I), last(I)
    @assert l ≤ r
    (1 ≤ l && r ≤ fw.n) || throw(BoundsError())
    prefixsum(fw, r) - prefixsum(fw, l - 1)
end

function comp(as)
    xs = unique!(sort(as))
    [searchsortedfirst(xs, a) for a in as]
end

const Point = NTuple{2,Int}

function solve(n, as, bs)
    as = comp(as)
    bs = comp(bs)
    count = Dict{Point,Int}()
    ps = Point[]
    for i in 1:n
        a, b = as[i], bs[i]
        push!(ps, (a, b))
        count[(a, b)] = get(count, (a, b), 0) + 1
    end
    unique!(ps)
    sort!(ps, by=x -> (x[1], -x[2]))
    res = 0
    ft = FenwickTree{Int}(maximum(bs))
    for (x, y) in ps
        m = count[(x, y)]
        res += m * (prefixsum(ft, ft.n) - prefixsum(ft, y - 1))
        res += m^2
        add!(ft, y, m)
    end
    res
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    bs = parse.(Int, split(readline()))
    println(solve(n, as, bs))
end

main()
