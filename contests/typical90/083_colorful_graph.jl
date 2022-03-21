function solve(n, m, as, bs, q, xs, ys)
    graph = [Int64[] for _ in 1:n]
    for i in 1:m
        push!(graph[as[i]], bs[i])
        push!(graph[bs[i]], as[i])
    end
    th = isqrt(2 * m)
    isbig = length.(graph) .≥ th
    graph_b = [[x for x in graph[i] if isbig[x]] for i in 1:n]
    cs = ones(Int64, n) # color
    ds = zeros(Int64, n) # query
    for i in 1:q
        x = xs[i]
        if isbig[x]
            println(cs[x])
            cs[x] = ys[i]
            for ne in graph_b[x]
                cs[ne] = ys[i]
            end
        else
            mi = ds[x]
            for ne in graph[x]
                mi = max(mi, ds[ne])
                isbig[ne] && (cs[ne] = ys[i])
            end
            println(mi == 0 ? 1 : ys[mi])
        end
        ds[x] = i
    end
end

function main()
    n, m = parse.(Int64, split(readline()))
    as = zeros(Int64, m)
    bs = zero(as)
    for i in 1:m
        as[i], bs[i] = parse.(Int64, split(readline()))
    end
    q = parse(Int64, readline())
    xs = zeros(Int64, q)
    ys = zero(xs)
    for i in 1:q
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    solve(n, m, as, bs, q, xs, ys)
end

main()
