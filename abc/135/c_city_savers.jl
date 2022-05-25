parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as, bs)
    res = 0
    for i in 1:n
        t = min(as[i], bs[i])
        res += t
        as[i] -= t
        bs[i] -= t
        u = min(as[i+1], bs[i])
        res += u
        as[i+1] -= u
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    bs = parseints()
    println(solve(n, as, bs))
end

main()
