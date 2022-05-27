parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function dfs!(graph, ads, counter, par, i, x)
    counter[i] += x
    for v in graph[i]
        v == par && continue
        dfs!(graph, ads, counter, i, v, x + ads[v])
    end
end

function solve(n, q, as, bs, ps, xs)
    ads = zeros(Int, n)
    for i in 1:q
        ads[ps[i]] += xs[i]
    end

    graph = [Int[] for _ in 1:n]
    for i in 1:n-1
        push!(graph[as[i]], bs[i])
        push!(graph[bs[i]], as[i])
    end

    counter = zeros(Int, n)
    dfs!(graph, ads, counter, 0, 1, ads[1])
    counter
end

function main()
    n, q = parseints()
    as, bs = zeros(Int, n - 1), zeros(Int, n - 1)
    for i in 1:n-1
        as[i], bs[i] = parseints()
    end
    ps, xs = zeros(Int, q), zeros(Int, q)
    for i in 1:q
        ps[i], xs[i] = parseints()
    end
    println(join(solve(n, q, as, bs, ps, xs), " "))
end

main()
