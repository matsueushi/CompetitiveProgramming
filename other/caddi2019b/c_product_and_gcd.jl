using Primes

parseints() = parse.(Int, split(readline()))

function solve(n, p)
    d = factor(Dict, p)
    res = 1
    for (k, v) in pairs(d)
        m = v ÷ n
        res *= k^m
    end
    res
end

function main()
    n, p = parseints()
    println(solve(n, p))
end

main()
