parseint() = parse(Int, readline())

function solve(n, as)
    res = 0
    for i in 1:n
        if i != 1
            x = min(as[i-1], as[i])
            res += x
            as[i] -= x
        end
        y = as[i] >> 1
        res += y
        as[i] -= y << 1
    end
    res
end

function main()
    n = parseint()
    as = zeros(Int, n)
    for i in 1:n
        as[i] = parseint()
    end
    solve(n, as) |> println
end

main()
