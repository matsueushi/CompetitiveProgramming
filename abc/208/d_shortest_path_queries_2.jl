parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, m, as, bs, cs)
    # frold-warshall
    infd = typemax(Int) >> 2
    dist = fill(infd, n, n)
    for i in 1:n
        dist[i, i] = 0
    end
    for (a, b, c) in zip(as, bs, cs)
        dist[a, b] = c
    end
    res = 0
    for k in 1:n
        for i in 1:n
            for j in 1:n
                dist[i, j] = min(dist[i, j], dist[i, k] + dist[k, j])
                dist[i, j] == infd && continue
                res += dist[i, j]
            end
        end
    end
    res
end

function main()
    n, m = parseints()
    as, bs, cs = zeros(Int, m), zeros(Int, m), zeros(Int, m)
    for i in 1:m
        as[i], bs[i], cs[i] = parseints()
    end
    solve(n, m, as, bs, cs) |> println
end

main()
