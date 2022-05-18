function solve(n, as)
    counter = Dict{Int,Int}()
    for i in 1:n
        counter[as[i]] = get(counter, as[i], 0) + 1
    end
    full = 0
    for (k, v) in pairs(counter)
        full += v * (v - 1) ÷ 2
    end
    for i in 1:n
        println(full - counter[as[i]] + 1)
    end
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    solve(n, as)
end

main()
