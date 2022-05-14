function solve(n, m, as, bs)
    roads = zeros(Int, n)
    for i in 1:m
        roads[as[i]] += 1
        roads[bs[i]] += 1
    end
    roads
end

function main()
    n, m = parse.(Int, split(readline()))
    as, bs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(join(solve(n, m, as, bs), "\n"))
end

main()
