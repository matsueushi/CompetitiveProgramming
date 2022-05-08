using Primes

function main()
    ptable = primes(10^6)
    cubetable = ptable .^ 3
    n = parse(Int, readline())
    up = isqrt(isqrt(n))
    ans = 0
    for (i, p) in enumerate(ptable)
        p > up && break
        ind = searchsortedlast(cubetable, n ÷ p)
        if ind > i
            ans += ind - i
        end
    end
    println(ans)
end

main()
