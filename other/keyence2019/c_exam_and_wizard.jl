parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as, bs)
    cs = as .- bs
    sum(cs) ≥ 0 || return -1
    sort!(cs)
    neg = 0
    res = 0
    for c in cs
        c < 0 || break
        res += 1
        neg += -c
    end
    neg == 0 && return 0
    while neg > 0
        if cs[end] == 0
            res += 1
            pop!(cs)
        end
        t = min(cs[end], neg)
        cs[end] -= t
        neg -= t
    end
    res += 1
    res
end

function main()
    n = parseint()
    as = parseints()
    bs = parseints()
    println(solve(n, as, bs))
end

main()
