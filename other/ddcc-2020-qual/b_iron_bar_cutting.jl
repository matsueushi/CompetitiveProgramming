parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function main()
    n = parseint()
    as = parseints()
    cas = cumsum(as)
    s = last(cas)
    ind = searchsortedfirst(cas, s >> 1)
    res = abs(s - 2 * cas[ind])
    if ind != 1
        res = min(res, abs(s - 2 * cas[ind-1]))
    end
    if ind != n
        res = min(res, abs(s - 2 * cas[ind+1]))
    end
    println(res)
end

main()
