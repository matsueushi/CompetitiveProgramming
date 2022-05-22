parseints() = parse.(Int, split(readline()))

using Primes

function solve(a, b)
    g = gcd(a, b)
    ifelse(g == 1, 1, length(factor(g)) + 1)
end

function main()
    a, b = parseints()
    println(solve(a, b))
end

main()
