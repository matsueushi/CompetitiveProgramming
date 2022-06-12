parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    n == 1 && return 0
    vs = [as[i] - i for i in 1:n]
    sort!(vs)
    res = typemax(Int)
    for x in (vs[n>>1], vs[n>>1+1])
        res = min(res, sum(abs.(vs .- x)))
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
