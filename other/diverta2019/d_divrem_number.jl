parseint() = parse(Int, readline())

function solve(n)
    res = 0
    for t in 1:isqrt(n)
        x, r = divrem(n, t)
        (r == 0 && t < x - 1) || continue
        res += x - 1
    end
    res
end

function main()
    n = parseint()
    println(solve(n))
end

main()
