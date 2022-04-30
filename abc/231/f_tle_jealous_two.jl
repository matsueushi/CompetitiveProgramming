# TLE

function comp(as)
    xs = sort(as)
    [searchsortedfirst(xs, a) for a in as]
end

function solve(n, as, bs)
    as = comp(as)
    bs = comp(bs)
    na = maximum(as)
    vs = [Int[] for _ in 1:na]
    for i in 1:n
        push!(vs[as[i]], bs[i])
    end
    for j in 1:na
        sort!(vs[j])
    end
    ls = length.(vs)
    res = 0
    for i in 1:n
        for j in 1:as[i]
            k = searchsortedfirst(vs[j], bs[i])
            res += ls[j] - k + 1
        end
    end
    res
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    bs = parse.(Int, split(readline()))
    println(solve(n, as, bs))
end

main()
