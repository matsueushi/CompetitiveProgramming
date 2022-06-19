parseint() = parse(Int, readline())

function solve(n, as)
    sort!(as)
    bs = diff(as)
    res = 0
    for i in 1:n-1
        d = min(i, n - i)
        res += 2 * d * bs[i]
    end
    if iseven(n)
        res -= bs[n>>1]
    else
        res -= min(bs[n>>1], bs[n>>1+1])
    end
    res
end

function main()
    n = parseint()
    as = zeros(Int, n)
    for i in 1:n
        as[i] = parseint()
    end
    solve(n, as) |> println
end

main()
