# working...

struct LazyRangeUpdateQuery{T<:Number}
    rmq::Vector{T}
    lazy::Vector{T}
    n::Int
    m::Int
    fillf::Function
    applyf::Function
end

function LazyRangeUpdateQuery(xs::AbstractVector{T}, fillf = typemax, applyf = min) where {T<:Number}
    n = length(xs)
    m = 1
    while (m < n)
        m *= 2
    end
    rmq = fill(fillf(T), 2 * m - 1)
    lazy = fill(fillf(T), 2 * m - 1)
    rmq[m:m+n-1] = xs
    for i in Iterators.reverse(1:m-1)
        rmq[i] = applyf(rmq[2*i], rmq[2*i+1])
    end
    LazyRangeUpdateQuery(rmq, lazy, n, m, fillf, applyf)
end

LazyRangeUpdateQuery{T}(n::Integer, fillf = typemax, applyf = min) where {T<:Number} = LazyRangeUpdateQuery(zeros(T, n), fillf, applyf)

function evaluate!(q::LazyRangeUpdateQuery{T}, k::Integer) where {T<:Number}
    # println("evaluate", k)
    q.lazy[k] == q.fillf(T) && return
    if k < q.n
        q.lazy[2*k] = q.lazy[k]
        q.lazy[2*k+1] = q.lazy[k]
    end
    q.rmq[k] = q.lazy[k]
    q.lazy[k] = q.fillf(T)
end

function update!(q::LazyRangeUpdateQuery{T}, a::Integer, b::Integer, k::Integer, l::Integer, r::Integer, x::T) where {T<:Number}
    # println("update", (a, b, k, l, r, x))
    @boundscheck 1 <= k <= q.n || throw(ArgumentError("index should be in between 1 and $(q.n)"))
    evaluate!(q, k)
    if a ≤ l && r ≤ b
        q.lazy[k] = x
        evaluate!(q, k)
    elseif a < r && l < b
        update!(q, a, b, 2 * k, l, (l + r) ÷ 2, x)
        update!(q, a, b, 2 * k + 1, (l + r) ÷ 2 + 1, r, x)
        q.rmq[k] = q.applyf(q.rmq[2*k], q.rmq[2*k+1])
    end
end

update!(q::LazyRangeUpdateQuery{T}, a::Integer, b::Integer, x::T) where {T<:Number} = update!(q, a, b, 1, 1, q.n, x)

function query(q::LazyRangeUpdateQuery{T}, a::Integer, b::Integer, k::Integer, l::Integer, r::Integer) where {T<:Number}
    # println("query", (a, b, k, l, r))
    evaluate!(q, k)
    (r < a || b < l) && return q.fillf(T)
    (a ≤ l && r ≤ b) && return q.rmq[k]
    vl = query(q, a, b, 2 * k, l, (l + r) ÷ 2)
    vr = query(q, a, b, 2 * k + 1, (l + r) ÷ 2 + 1, r)
    q.applyf(vl, vr)
end

query(q::LazyRangeUpdateQuery{T}, a::Integer, b::Integer) where {T<:Number} = query(q, a, b, 1, 1, q.n)

function long_bricks(w, ls, rs)
    q = LazyRangeUpdateQuery{Int64}(w, zero, max)
    println(q.rmq, q.lazy)
    for (l, r) in zip(ls, rs)
        println((l, r))
        h = query(q, l, r)
        update!(q, l, r, h + 1)
        println(q.rmq, q.lazy)
        println(h + 1)
    end
end

function main()
    w, n = parse.(Int64, split(readline()))
    ls = zeros(Int64, n)
    rs = zeros(Int64, n)
    for i in 1:n
        ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    println(long_bricks(w, ls, rs))
end

main()