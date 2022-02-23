using DataStructures

function solve(n, xs, ys)
    graph = [Set{Int64}() for _ in 1:n]
    for i in 1:n
        push!(graph[xs[i]], i)
        push!(graph[ys[i]], i)
    end

    explored = falses(n)
    res = zeros(Int64, n)
    frontier = Queue{Int64}()
    for i in 1:n
        i in graph[i] && enqueue!(frontier, i)
    end
    i = 0
    while !isempty(frontier)
        x = dequeue!(frontier)
        explored[x] && continue
        i += 1
        res[i] = x
        explored[x] = true
        for f in graph[x]
            enqueue!(frontier, f)
        end
    end
    i, reverse!(res)
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    i, res = solve(n, xs, ys)
    println(i == n ? join(res, "\n") : "-1")
end

main()
