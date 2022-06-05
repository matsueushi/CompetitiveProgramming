parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    t = sum(as)
    t -= as[1]
    h = as[1]
    res = abs(h - t)
    for i in 2:n-1
        t -= as[i]
        h += as[i]
        res = min(res, abs(h - t))
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
