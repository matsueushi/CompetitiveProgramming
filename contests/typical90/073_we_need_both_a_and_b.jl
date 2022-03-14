const P = 10^9 + 7

function dfs!(graph, ds, ptns, par, i)
    samec = 1
    allc = 1
    for ni in graph[i]
        ni == par && continue
        dfs!(graph, ds, ptns, i, ni)

        allc *= ptns[ni, 1] + ptns[ni, 2] + 2 * ptns[ni, 3]
        allc %= P

        samec *= ptns[ni, ds[i]] + ptns[ni, 3]
        samec %= P
    end
    ptns[i, ds[i]] = samec
    ptns[i, 3] = mod(allc - samec, P)
end

function solve(n, cs, xs, ys)
    graph = [Int64[] for _ in 1:n]
    for (x, y) in zip(xs, ys)
        push!(graph[x], y)
        push!(graph[y], x)
    end
    ds = [x == "a" ? 1 : 2 for x in cs]
    ptns = zeros(Int64, n, 3)
    dfs!(graph, ds, ptns, -1, 1)
    ptns[1, 3]
end

function main()
    n = parse(Int64, readline())
    cs = split(readline())
    xs = zeros(Int64, n - 1)
    ys = zero(xs)
    for i in 1:n-1
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, cs, xs, ys))
end

main()
