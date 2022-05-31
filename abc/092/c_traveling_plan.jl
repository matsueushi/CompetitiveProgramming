parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    bs = vcat([0], as, [0])
    ds = diff(bs)
    d = sum(abs.(ds))
    res = zeros(Int, n)
    for i in 1:n
        d2 = d - abs(ds[i]) - abs(ds[i+1]) + abs(bs[i+2] - bs[i])
        res[i] = d2
    end
    res
end

function main()
    n = parseint()
    as = parseints()
    for d in solve(n, as)
        println(d)
    end
end

main()
