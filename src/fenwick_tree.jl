"""
    FenwickTree{T}(n::Int)
Construct a FenwickTree of length `n`.

    add!(fw::FenwickTree{T}, ind::Int, x)
Increase the value of the FenwickTree at p. `a[ind] += x`.

    prefixsum(fw::FenwickTree{T}, r::Int)

    partialsum(fw::FenwirkTree{T}, I::AbstractUnitRante{Int})
Return `a[l] + a[l + 1] + ... + a[r]` where l = `first(I)` and r = `last(I)`.
"""

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
