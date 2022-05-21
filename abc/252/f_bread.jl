using DataStructures

parseints() = parse.(Int, split(readline()))

function solve(n, l, as)
    asum = sum(as)
    pq = PriorityQueue{Int,Int}()
    for i in 1:n
        enqueue!(pq, i => as[i])
    end
    if l != asum
        enqueue!(pq, 0 => l - asum)
    end

    res = 0
    while length(pq) > 1
        i1, l1 = peek(pq)
        dequeue!(pq)
        i2, l2 = peek(pq)
        dequeue!(pq)
        res += l1 + l2
        enqueue!(pq, i1 => l1 + l2)
    end
    res
end

function main()
    n, l = parseints()
    as = parseints()
    println(solve(n, l, as))
end

main()
