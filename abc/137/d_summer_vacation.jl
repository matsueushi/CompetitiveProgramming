parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

using DataStructures

function solve(n, m, as, bs)
    idx = sortperm(as)
    as = as[idx]
    bs = bs[idx]
    pq = PriorityQueue{Int,Int}(Base.Order.Reverse)
    k = 1
    res = 0
    for i in 1:m
        while k ≤ n && as[k] ≤ i
            enqueue!(pq, k => bs[k])
            k += 1
        end
        if !isempty(pq)
            _, v = peek(pq)
            dequeue!(pq)
            res += v
        end
    end
    res
end

function main()
    n, m = parseints()
    as, bs = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        as[i], bs[i] = parseints()
    end
    println(solve(n, m, as, bs))
end

main()
