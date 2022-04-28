const DMAX = 10^9 + 1

function solve(n, m, as, bs, cs)
    dist = fill(DMAX, n, n)
    connected = falses(n, n)
    drop = Set{NTuple{2,Int}}()

    for i in 1:n
        dist[i, i] = 0
    end

    for i in 1:m
        dist[as[i], bs[i]] = cs[i]
        dist[bs[i], as[i]] = cs[i]
        connected[as[i], bs[i]] = true
        connected[bs[i], as[i]] = true
    end

    for k in 1:n
        for i in 1:n
            for j in 1:n
                if dist[i, j] ≥ dist[i, k] + dist[k, j]
                    dist[i, j] = dist[i, k] + dist[k, j]
                    if i != k && j != k && i < j && connected[i, j]
                        push!(drop, (i, j))
                    end
                end
            end
        end
    end
    length(drop)
end

function main()
    n, m = parse.(Int, split(readline()))
    as = zeros(Int, m)
    bs = zero(as)
    cs = zero(as)
    for i in 1:m
        as[i], bs[i], cs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, as, bs, cs))
end

main()
