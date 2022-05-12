using DataStructures

function main()
    n = parse(Int, readline())
    vs = parse.(Int, split(readline()))
    sort!(vs)
    pq = PriorityQueue{Tuple{Int,Float64},Float64}()
    for i in 1:n
        v = vs[i]
        enqueue!(pq, (i, v) => v)
    end
    j = n
    while length(pq) ≥ 2
        j += 1
        _, x = dequeue!(pq)
        _, y = dequeue!(pq)
        z = (x + y) / 2
        enqueue!(pq, (j, z) => z)
    end
    println(last(first(only(pq))))
end

main()
