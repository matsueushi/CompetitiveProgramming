parseints() = parse.(Int, split(readline()))

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


function solve(n, m, q, ts, ps)
    res = Int[]
    latest = [(0, 0) for _ in 1:n]
    cs = zeros(Int, q)
    up = [Int[] for _ in 1:q]
    for k in 1:q
        t = ts[k]
        if t == 2
            i, x = ps[k]
            latest[i] = (k, x)
        elseif t == 3
            i, j = ps[k]
            k0, x = latest[i]
            push!(res, x)
            cs[k] = length(res)
            k0 != 0 && (push!(up[k0], k))
        end
    end

    fw = FenwickTree{Int}(m + 1)
    for k in 1:q
        t = ts[k]
        if t == 1
            l, r, x = ps[k]
            add!(fw, l, x)
            add!(fw, r + 1, -x)
        elseif t == 2
            for k1 in up[k]
                res[cs[k1]] -= prefixsum(fw, ps[k1][2])
            end
        elseif t == 3
            i, j = ps[k]
            res[cs[k]] += prefixsum(fw, j)
        end
    end
    res
end

function main()
    n, m, q = parseints()
    ts = zeros(Int, q)
    ps = Vector{Int}[]
    for i in 1:q
        ins = parseints()
        ts[i] = ins[1]
        push!(ps, ins[2:end])
    end
    for x in solve(n, m, q, ts, ps)
        println(x)
    end
end

main()

###########
# function input_gen(n, m, q)
#     ts = rand(1:3, q)
#     ps = Vector{Int}[]
#     for k in 1:q
#         if ts[k] == 1
#             l = rand(1:m)
#             r = rand(l:m)
#             x = rand(1:10^9)
#             push!(ps, [l, r, x])
#         elseif ts[k] == 2
#             i = rand(1:n)
#             x = rand(1:10^9)
#             push!(ps, [i, x])
#         else
#             i = rand(1:n)
#             j = rand(1:m)
#             push!(ps, [i, j])
#         end
#     end
#     ts, ps
# end

# function solve_naive(n, m, q, ts, ps)
#     a = zeros(Int, n, m)
#     res = Int[]
#     for k in 1:q
#         if ts[k] == 1
#             l, r, x = ps[k]
#             a[:, l:r] .+= x
#         elseif ts[k] == 2
#             i, x = ps[k]
#             a[i, :] .= x
#         else
#             i, j = ps[k]
#             push!(res, a[i, j])
#         end
#     end
#     res
# end

# function main2()
#     n, m, q = 4, 4, 100
#     for k in 1:100000
#         ts, ps = input_gen(n, m, q)
#         res_naive = solve_naive(n, m, q, ts, ps)
#         res = solve(n, m, q, ts, ps)
#         res_naive != res && (println(ts, ps, res_naive, res))
#     end
# end

# main2()
