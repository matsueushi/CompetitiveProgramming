struct BitIndexedTree
    n::Integer
    xs::Vector{Int64}
    BitIndexedTree(n::Integer) = new(n, zeros(Int64, n))
end

function sum(b::BitIndexedTree, i::Integer)
    s = 0
    while i > 0
        s += b.xs[i]
        i -= i & (-i)
    end
    s
end

function add!(b::BitIndexedTree, i::Integer, x::Int64)
    while i ≤ b.n
        b.xs[i] += x
        i += i & (-i)
    end
end

function solve(n, q, ts, xs, ys, vs)
    checked = falses(n)
    flag = BitIndexedTree(n)
    info = BitIndexedTree(n)
    for (t, x, y, v) in zip(ts, xs, ys, vs)
        if t == 0
            checked[x] && continue
            checked[x] = true
            add!(flag, x, 1)
            w = -(-1)^x * v
            add!(info, x, w)
        else
            fx = sum(flag, x - 1)
            fy = sum(flag, y - 1)
            if abs(fx - fy) != abs(x - y)
                println("Ambiguous")
                continue
            end
            ix = sum(info, x - 1)
            iy = sum(info, y - 1)
            b = (-1)^x * v
            by = b + iy - ix
            println((-1)^y * by)
        end
    end
end

function main()
    n = parse.(Int64, readline())
    q = parse.(Int64, readline())
    ts = zeros(Int64, q)
    xs = zeros(Int64, q)
    ys = zeros(Int64, q)
    vs = zeros(Int64, q)
    for i in 1:q
        ts[i], xs[i], ys[i], vs[i] = parse.(Int64, split(readline()))
    end
    solve(n, q, ts, xs, ys, vs)
end

main()
