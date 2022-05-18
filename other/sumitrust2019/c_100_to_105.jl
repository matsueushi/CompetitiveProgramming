function solve(x)
    res = x % 100
    a, r = divrem(res, 5)
    m = a + (r > 0)
    x ÷ 100 ≥ m
end

function main()
    x = parse(Int, readline())
    println(ifelse(solve(x), 1, 0))
end

main()
