parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    sort!(as, rev=true)
    bs = zeros(Int, n)
    bs[1] = cld(as[1], 2)
    for i in 1:n-1
        bs[i+1] = max(cld(as[i+1], 2), bs[i] - as[i+1])
    end
    asum = sum(as)
    res = 1
    for i in 2:n
        asum -= as[i-1]
        if asum ≥ bs[i-1]
            res += 1
        end
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
