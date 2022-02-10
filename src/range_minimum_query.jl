struct RangeMinimumQuery{T<:Number}
    rmq::Vector{T}
    n::Int
    m::Int
    fillf::Function
    applyf::Function
end

function RangeMinimumQuery(xs::AbstractVector{T}, fillf = typemax, applyf = min) where {T<:Number}
    n = length(xs)
    m = 1
    while m < n
        m *= 2
    end
    rmq = fill(fillf(T), 2 * m - 1)
    rmq[m:m+n-1] = xs
    for i in Iterators.reverse(1:m-1)
        rmq[i] = applyf(rmq[2*i], rmq[2*i+1])
    end
    RangeMinimumQuery(rmq, n, m, fillf, applyf)
end

RangeMinimumQuery{T}(n::Integer, fillf = typemax, applyf = min) where {T<:Number} = RangeMinimumQuery(zeros(T, n), fillf, applyf)

function update!(q::RangeMinimumQuery{T}, i::Integer, x::T) where {T<:Number}
    @boundscheck 1 <= i <= q.n || throw(ArgumentError("index should be in between 1 and $(q.n)"))
    i += q.m - 1
    q.rmq[i] = x
    @inbounds while i > 1
        i ÷= 2
        q.rmq[i] = q.applyf(q.rmq[2*i], q.rmq[2*i+1])
    end
end

function query(q::RangeMinimumQuery{T}, a::Integer, b::Integer, k::Integer, l::Integer, r::Integer) where {T<:Number}
    (r < a || b < l) && return q.fillf(T)
    (a ≤ l && r ≤ b) && return q.rmq[k]
    vl = query(q, a, b, 2 * k, l, (l + r) ÷ 2)
    vr = query(q, a, b, 2 * k + 1, (l + r) ÷ 2 + 1, r)
    q.applyf(vl, vr)
end

query(q::RangeMinimumQuery{T}, a::Integer, b::Integer) where {T<:Number} = query(q, a, b, 1, 1, q.n)
