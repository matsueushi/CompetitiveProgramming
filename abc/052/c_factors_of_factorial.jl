using Primes

const P = 10^9 + 7

parseint() = parse(Int, readline())

function solve(n)
    d = Dict{Int,Int}()
    for i in 1:n
        for (k, v) in pairs(factor(i))
            d[k] = get(d, k, 0) + v
        end
    end

    res = 1
    for (k, v) in pairs(d)
        res = (res * (v + 1)) % P
    end
    res
end

function main()
    n = parseint()
    println(solve(n))
end

main()
