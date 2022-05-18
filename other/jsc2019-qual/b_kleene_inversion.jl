const P = 10^9 + 7
const A_MAX = 2000

struct FenwickTree{T}
    data::Vector{T}
    n::Int
end

FenwickTree{T}(n::Int) where {T} = FenwickTree(zeros(T, n), n)

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

function partialsum(fw::FenwickTree{T}, I::AbstractUnitRange{Int}) where {T}
    l, r = first(I), last(I)
    l ≤ r || return zero(T)
    (1 ≤ l && r ≤ fw.n) || throw(BoundsError())
    prefixsum(fw, r) - prefixsum(fw, l - 1)
end


function solve(n, k, as)
    fw = FenwickTree{Int}(A_MAX)
    res = 0
    for i in 1:n
        a = as[i]
        over = partialsum(fw, a+1:A_MAX)
        m = k * (k + 1) ÷ 2 % P
        res += over * m
        res %= P
        under = partialsum(fw, 1:a-1)
        m = k * (k - 1) ÷ 2 % P
        res += under * m
        res %= P
        add!(fw, a, 1)
    end
    res
end

function main()
    n, k = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, k, as))
end

main()
