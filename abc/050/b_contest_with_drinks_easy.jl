function solve(n, ts, m, ps, xs)
    tot = sum(ts)
    res = fill(tot, m)
    for i in 1:m
        res[i] -= ts[ps[i]] - xs[i]
    end
    res
end

function main()
    n = parse(Int, readline())
    ts = parse.(Int, split(readline()))
    m = parse(Int, readline())
    ps, xs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        ps[i], xs[i] = parse.(Int, split(readline()))
    end
    println(join(solve(n, ts, m, ps, xs), "\n"))
end

main()
