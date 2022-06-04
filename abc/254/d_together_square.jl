using Primes

parseint() = parse(Int, readline())

function solve(n)
    qs = [i^2 for i in 1:isqrt(n)]
    fs = zeros(Int, n)
    for i in 1:n
        d = factor(Dict, i)
        x = 1
        for (k, v) in pairs(d)
            isodd(v) && (x *= k)
        end
        fs[i] = x
    end
    res = 0
    for i in 1:n
        res += searchsortedlast(qs, n ÷ fs[i])
    end
    res
end

function main()
    n = parseint()
    println(solve(n))
end

main()
