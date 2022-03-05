function dfs!(graph, used, match, v)
    used[v] = true
    for u in graph[v]
        w = match[u]
        if w < 0 || (!used[w] && dfs!(graph, used, match, w))
            match[v] = u
            match[u] = v
            return true
        end
    end
    return false
end

function solve(n, t, axs, ays, bxs, bys)
    dx = t .* [1, 1, 0, -1, -1, -1, 0, 1]
    dy = t .* [0, 1, 1, 1, 0, -1, -1, -1]

    bd = Dict((bxs[i], bys[i]) => i for i in 1:n)
    graph = [Int64[] for _ in 1:2*n]
    direction = Dict{Pair{Int64,Int64},Int64}()

    for i in 1:n
        ax, ay = axs[i], ays[i]
        for j in 1:8
            b = (ax + dx[j], ay + dy[j])
            if haskey(bd, b)
                eb = n + bd[b]
                push!(graph[i], eb)
                push!(graph[eb], i)
                direction[i=>eb] = j
            end
        end
    end

    res = 0
    match = fill(-1, 2 * n)
    used = falses(2 * n)
    for v in 1:n
        if match[v] < 0
            fill!(used, false)
            if dfs!(graph, used, match, v)
                res += 1
            end
        end
    end

    if res == n
        println("Yes")
        ans = [direction[i=>match[i]] for i in 1:n]
        println(join(ans, " "))
    else
        println("No")
    end
end

function main()
    n, t = parse.(Int64, split(readline()))
    axs = zeros(Int64, n)
    ays = zeros(Int64, n)
    bxs = zeros(Int64, n)
    bys = zeros(Int64, n)
    for i in 1:n
        axs[i], ays[i] = parse.(Int64, split(readline()))
    end
    for i in 1:n
        bxs[i], bys[i] = parse.(Int64, split(readline()))
    end
    solve(n, t, axs, ays, bxs, bys)
end

main()
