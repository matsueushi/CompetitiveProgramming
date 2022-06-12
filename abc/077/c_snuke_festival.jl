parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as, bs, cs)
    sort!(as)
    sort!(bs)
    sort!(cs)
    res = 0
    for i in 1:n
        uind = searchsortedlast(as, bs[i] - 1)
        dind = searchsortedfirst(cs, bs[i] + 1)
        res += uind * (n + 1 - dind)
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    bs = parseints()
    cs = parseints()
    println(solve(n, as, bs, cs))
end

main()
