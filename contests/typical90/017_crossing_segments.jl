struct BitIndexedTree
    bit::Vector{Int64}
    BitIndexedTree(n::Integer) = new(zeros(Int64, n))
end

function add!(b::BitIndexedTree, i::Integer, x::Int64)
    n = length(b.bit)
    while (i ≤ n)
        b.bit[i] += x
        i += i & (-i)
    end
end

function sum(b::BitIndexedTree, i::Integer)
    s = 0
    while (i > 0)
        s += b.bit[i]
        i -= i & (-i)
    end
    s
end

struct IntervalBitIndexedTree
    bit0::BitIndexedTree
    bit1::BitIndexedTree
    IntervalBitIndexedTree(n::Integer) = new(BitIndexedTree(n), BitIndexedTree(n))
end

function add!(ib::IntervalBitIndexedTree, l::Integer, r::Integer, x::Int64)
    add!(ib.bit0, l, -x * (l - 1))
    add!(ib.bit1, l, x)
    add!(ib.bit0, r + 1, x * r)
    add!(ib.bit1, r + 1, -x)
end

function sum(ib::IntervalBitIndexedTree, i::Integer)
    sum(ib.bit1, i) * i + sum(ib.bit0, i)
end

function crossing(n, ls, rs)
    idx = sortperm(rs)
    ls = ls[idx]
    rs = rs[idx]
    midcount = IntervalBitIndexedTree(n)
    currentls = Int64[]
    r_current = first(rs)
    crosses = 0
    for (l, r) in zip(ls, rs)
        if r_current != r
            for cl in currentls
                add!(midcount, cl + 1, r_current - 1, 1)
            end
            empty!(currentls)
            r_current = r
        end
        crosses += sum(midcount, l) - sum(midcount, l - 1)
        push!(currentls, l)
    end
    crosses
end

function main()
    n, m = parse.(Int64, split(readline()))
    ls = zeros(Int64, m)
    rs = zeros(Int64, m)
    for i in 1:m
        ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    println(crossing(n, ls, rs))
end

main()
