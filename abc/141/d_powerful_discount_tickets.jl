using DataStructures

function solve(n, m, as)
    pq = PriorityQueue{Pair{Int,Int},Int}(Base.Order.Reverse)
    for i in 1:n
        enqueue!(pq, i => as[i], as[i])
    end
    for _ in 1:m
        ind, val = dequeue!(pq)
        enqueue!(pq, ind => val >> 1, val >> 1)
    end
    res = 0
    while !isempty(pq)
        ind, val = dequeue!(pq)
        res += val
    end
    res
end

function main()
    n, m = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, m, as))
end

main()
