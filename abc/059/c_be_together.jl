parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    asum = sum(as)
    u = cld(asum, n)
    d = fld(asum, n)
    min(sum((as .- u) .^ 2), sum((as .- d) .^ 2))
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
