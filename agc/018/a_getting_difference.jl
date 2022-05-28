parseints() = parse.(Int, split(readline()))

function solve(n, k, as)
    m = maximum(as)
    l = gcd(as)
    k % l == 0 && k ≤ m
end

function main()
    n, k = parseints()
    as = parseints()
    println(ifelse(solve(n, k, as), "POSSIBLE", "IMPOSSIBLE"))
end

main()
