parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function dfs!(graph, paths, f, t)
    push!(paths, t)
    for u in graph[t]
        u == f && continue
        dfs!(graph, paths, t, u)
        push!(paths, t)
    end
end

function solve(n, as, bs)
    graph = [Int[] for _ in 1:n]
    for i in 1:n-1
        a, b = as[i], bs[i]
        push!(graph[a], b)
        push!(graph[b], a)
    end
    for i in 1:n
        sort!(graph[i])
    end
    paths = Int[]
    dfs!(graph, paths, -1, 1)
    paths
end

function main()
    n = parseint()
    as, bs = parsepoints(n - 1)
    join(solve(n, as, bs), " ") |> println
end

main()
