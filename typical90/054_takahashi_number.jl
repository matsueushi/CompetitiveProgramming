using DataStructures

function solve(n, m, rss)
    authors = [Set{Int64}() for _ in 1:n]
    for (i, rs) in enumerate(rss)
        for r in rs
            push!(authors[r], i)
        end
    end
    distances = fill(-1, n)
    distances[1] = 0
    resolved = falses(m)
    q = Queue{Int64}()
    enqueue!(q, 1)
    while !isempty(q)
        x = dequeue!(q)
        dx = distances[x]
        for p in authors[x]
            resolved[p] && continue
            resolved[p] = true
            for r in rss[p]
                distances[r] ≥ 0 && dx + 1 > distances[r] && continue
                distances[r] = dx + 1
                enqueue!(q, r)
            end
        end
    end
    distances
end

function main()
    n, m = parse.(Int64, split(readline()))
    rss = Vector{Int64}[]
    for i in 1:m
        k = parse(Int64, readline())
        rs = parse.(Int64, split(readline()))
        push!(rss, rs)
    end
    println(join(solve(n, m, rss), "\n"))
end

main()
