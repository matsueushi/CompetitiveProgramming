parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, x, as)
    res = 0
    r = as[1] - min(as[1], x)
    res += r
    as[1] -= r
    for i in 2:n
        r = max(0, as[i] + as[i-1] - x)
        res += r
        as[i] -= r
    end
    res
end

function main()
    n, x = parseints()
    as = parseints()
    solve(n, x, as) |> println
end

main()
