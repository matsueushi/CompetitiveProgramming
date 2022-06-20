parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function threshold(as, k)
    sum(as) < k && return 0
    l = 0
    r = maximum(as)
    while r - l > 1
        m = (l + r) ÷ 2
        s = 0
        for a in as
            s += max(0, a - m)
        end
        if s < k
            r = m
        else
            l = m
        end
    end
    r
end

function solve(n, k, as)
    sort!(as, rev=true)
    th = threshold(as, k)
    c = k
    res = 0
    for i in 1:n
        x = min(c, max(0, as[i] - th))
        res += as[i] * x - x * (x - 1) ÷ 2
        as[i] -= x
        c -= x
        c == 0 && break
    end
    for i in 1:n
        (c == 0 || as[i] == 0) && break
        c -= 1
        res += as[i]
        as[i] -= 1
    end
    res
end

function main()
    n, k = parseints()
    as = parseints()
    solve(n, k, as) |> println
end

main()
