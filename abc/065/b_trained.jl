function solve(n, as)
    used = falses(n)
    a = 1
    c = 0
    while !used[a]
        a == 2 && return c
        used[a] = true
        a = as[a]
        c += 1
    end
    -1
end

function main()
    n = parse(Int, readline())
    as = zeros(Int, n)
    for i in 1:n
        as[i] = parse(Int, readline())
    end
    println(solve(n, as))
end

main()
