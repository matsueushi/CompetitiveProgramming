using DataStructures

const P = 10^9 + 7

parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, m, as, bs)
    graph = [Int[] for _ in 1:n]
    for (a, b) in zip(as, bs)
        push!(graph[a], b)
        push!(graph[b], a)
    end

    dist = fill(typemax(Int), n)
    dist[1] = 0
    dq = Deque{Pair{Int,Int}}()
    push!(dq, 1 => 0)
    while !isempty(dq)
        v, d = popfirst!(dq)
        for u in graph[v]
            if d + 1 < dist[u]
                dist[u] = d + 1
                push!(dq, u => d + 1)
            end
        end
    end

    dist[n] == typemax(Int) && return 0

    dist_ns = [Int[] for _ in 1:n]
    for i in 1:n
        dist[i] == typemax(Int) && continue
        push!(dist_ns[dist[i]+1], i)
    end

    paths = zeros(Int, n)
    paths[1] = 1
    for i in 1:n
        for u in dist_ns[i]
            for v in graph[u]
                dist[v] == i || continue
                paths[v] += paths[u]
                paths[v] %= P
            end
        end
    end
    paths[n]
end

function main()
    n, m = parseints()
    as, bs = parsepoints(m)
    solve(n, m, as, bs) |> println
end

main()
