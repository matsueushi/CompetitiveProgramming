struct RangeMinimumQuery{T<:Number}
    rmq::Vector{T}
    n::Int
    m::Int
end

function RangeMinimumQuery(xs::AbstractVector{T}) where {T<:Number}
    n = length(xs)
    m = 1
    while m < n
        m *= 2
    end
    rmq = fill(typemax(T), 2 * m - 1)
    rmq[m:m+n-1] = xs
    for i in Iterators.reverse(1:m-1)
        rmq[i] = min(rmq[2*i], rmq[2*i+1])
    end
    RangeMinimumQuery(rmq, n, m)
end

RangeMinimumQuery{T}(n::Integer) where {T<:Number} = RangeMinimumQuery(zeros(T, n))

function update!(q::RangeMinimumQuery{T}, i::Integer, x::T) where {T<:Number}
    @boundscheck 1 <= i <= q.n || throw(ArgumentError("index should be in between 1 and $(q.n)"))
    i += q.m - 1
    q.rmq[i] = x
    @inbounds while i > 1
        i ÷= 2
        q.rmq[i] = min(q.rmq[2*i], q.rmq[2*i+1])
    end
end


function query(q::RangeMinimumQuery{T}, a::Integer, b::Integer, k::Integer, l::Integer, r::Integer) where {T<:Number}
    (r < a || b < l) && return typemax(T)
    (a ≤ l && r ≤ b) && return q.rmq[k]
    vl = query(q, a, b, 2 * k, l, (l + r) ÷ 2)
    vr = query(q, a, b, 2 * k + 1, (l + r) ÷ 2 + 1, r)
    min(vl, vr)
end

query(q::RangeMinimumQuery{T}, a::Integer, b::Integer) where {T<:Number} = query(q, a, b, 1, 1, q.n)
