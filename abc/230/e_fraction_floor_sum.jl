parseint() = parse(Int, readline())

function solve(n)
    m = isqrt(n)
    r = n ÷ (m + 1)
    res = 0
    for i in 1:r
        res += n ÷ i
    end
    for k in 1:m
        res += k * (n ÷ k - n ÷ (k + 1))
    end
    res
end

function main()
    n = parseint()
    solve(n) |> println
end

main()
