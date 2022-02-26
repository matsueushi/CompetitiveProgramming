function reachable(n, graph, as, bs, iter)
    dp = zeros(Int64, n)
    for s in iter
        dp[as[s]] |= 1 << ((s - 1) % 64)
    end
    for i in 1:n
        for x in graph[i]
            dp[i] |= dp[x]
        end
    end
    for s in iter
        println(dp[bs[s]] & 1 << ((s - 1) % 64) == 0 ? "No" : "Yes")
    end
end

function solve(n, m, q, xs, ys, as, bs)
    graph = [Int64[] for _ in 1:n]
    for i in 1:m
        push!(graph[ys[i]], xs[i])
    end
    for subq in Iterators.partition(1:q, 64)
        reachable(n, graph, as, bs, subq)
    end
end

function main()
    n, m, q = parse.(Int64, split(readline()))
    xs = zeros(Int64, m)
    ys = zeros(Int64, m)
    as = zeros(Int64, q)
    bs = zeros(Int64, q)
    for i in 1:m
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    for j in 1:q
        as[j], bs[j] = parse.(Int64, split(readline()))
    end
    solve(n, m, q, xs, ys, as, bs)
end

main()
