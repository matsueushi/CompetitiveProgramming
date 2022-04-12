function dfs(dp, graph, pos, pre)
    dp[pos] = 1
    for x in graph[pos]
        x != pre && (dp[pos] += dfs(dp, graph, x, pos))
    end
    dp[pos]
end

function solve(n, xs, ys)
    graph = [Int64[] for _ in 1:n]
    for i in 1:n-1
        push!(graph[xs[i]], ys[i])
        push!(graph[ys[i]], xs[i])
    end
    dp = zeros(Int64, n)
    for x in graph[1]
        dfs(dp, graph, x, 1)
    end
    res = 0
    for i in 2:n
        res += dp[i] * (n - dp[i])
    end
    res
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n - 1)
    ys = zeros(Int64, n - 1)
    for i in 1:n-1
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, xs, ys))
end

main()
