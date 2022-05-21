parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    res = n * (n - 1) * (n - 2) ÷ 6

    counter = Dict{Int,Int}()
    for i in 1:n
        counter[as[i]] = get(counter, as[i], 0) + 1
    end

    for (k, v) in pairs(counter)
        res -= v * (v - 1) ÷ 2 * (n - v)
        res -= v * (v - 1) * (v - 2) ÷ 6
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
