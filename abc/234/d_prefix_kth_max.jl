using DataStructures

function solve(n, k, ps)
    pq = PriorityQueue{Int,Int}()
    for i in 1:k
        enqueue!(pq, i => ps[i])
    end
    for i in k+1:n
        _, v = peek(pq)
        println(v)
        if v < ps[i]
            dequeue!(pq)
            enqueue!(pq, i => ps[i])
        end
    end
    _, v = peek(pq)
    println(v)
end

function main()
    n, k = parse.(Int, split(readline()))
    ps = parse.(Int, split(readline()))
    solve(n, k, ps)
end

main()
