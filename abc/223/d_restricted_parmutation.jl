using DataStructures

function solve(n, m, as, bs)
    graph = [Int[] for _ in 1:n]
    indeg = zeros(Int, n)
    for i in 1:m
        push!(graph[as[i]], bs[i])
        indeg[bs[i]] += 1
    end

    pq = PriorityQueue{Int,Int}()
    vs = Int[]
    for i in 1:n
        indeg[i] == 0 && (enqueue!(pq, i => i))
    end

    while !isempty(pq)
        v = dequeue!(pq)
        for u in graph[v]
            indeg[u] -= 1
            indeg[u] == 0 && (enqueue!(pq, u => u))
        end
        push!(vs, v)
    end
    vs
end

function main()
    n, m = parse.(Int, split(readline()))
    as, bs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    vs = solve(n, m, as, bs)
    if length(vs) < n
        println(-1)
    else
        println(join(vs, " "))
    end
end

main()
