parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(k, a, b)
    (k ≤ a - 1 || b ≤ a + 2) && return k + 1
    k -= (a - 1)
    x, r = divrem(k, 2)
    a + x * (b - a) + r
end

function main()
    k, a, b = parseints()
    println(solve(k, a, b))
end

main()
