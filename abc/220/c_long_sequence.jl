function solve(n, as, x)
    s = sum(as)
    c = cumsum(as)
    u, v = divrem(x, s)
    u * n + searchsortedlast(c, v) + 1
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    x = parse(Int, readline())
    println(solve(n, as, x))
end

main()
