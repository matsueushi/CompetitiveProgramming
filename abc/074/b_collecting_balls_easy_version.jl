function solve(n, k, xs)
    dist = 0
    for i in 1:n
        dist += 2 * min(xs[i], abs(k - xs[i]))
    end
    dist
end

function main()
    n = parse(Int, readline())
    k = parse(Int, readline())
    xs = parse.(Int, split(readline()))
    println(solve(n, k, xs))
end

main()
