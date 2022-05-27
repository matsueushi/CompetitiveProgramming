parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function dfs(graph, subt, par, i, d)
    x = d
    for v in graph[i]
        v == par && continue
        x += dfs(graph, subt, i, v, d + 1)
        subt[i] += subt[v]
    end
    x
end

function dfs2(graph, n, res, subt, par, i)
    for v in graph[i]
        v == par && continue
        res[v] = res[i] - subt[v] + (n - subt[v])
        dfs2(graph, n, res, subt, i, v)
    end
end

function solve(n, us, vs)
    graph = [Int[] for _ in 1:n]
    for i in 1:n-1
        push!(graph[us[i]], vs[i])
        push!(graph[vs[i]], us[i])
    end

    subt = ones(Int, n)
    d1 = dfs(graph, subt, 0, 1, 0)
    res = zeros(Int, n)
    res[1] = d1

    dfs2(graph, n, res, subt, 0, 1)
    res
end

function main()
    n = parseint()
    us, vs = zeros(Int, n), zeros(Int, n)
    for i in 1:n-1
        us[i], vs[i] = parseints()
    end
    for d in solve(n, us, vs)
        println(d)
    end
end

main()
