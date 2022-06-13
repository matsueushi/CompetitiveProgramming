parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    cs = cumsum(as)
    d = Dict{Int,Int}(0 => 1)
    for c in cs
        d[c] = get(d, c, 0) + 1
    end
    res = 0
    for v in values(d)
        res += v * (v - 1) ÷ 2
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    solve(n, as) |> println
end

main()
