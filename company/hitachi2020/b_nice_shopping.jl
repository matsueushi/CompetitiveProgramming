function solve(a, b, m, as, bs, xs, ys, cs)
    ans = minimum(as) + minimum(bs)
    for i in 1:m
        ans = min(ans, as[xs[i]] + bs[ys[i]] - cs[i])
    end
    ans
end

function main()
    a, b, m = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    bs = parse.(Int, split(readline()))
    xs, ys, cs = zeros(Int, m), zeros(Int, m), zeros(Int, m)
    for i in 1:m
        xs[i], ys[i], cs[i] = parse.(Int, split(readline()))
    end
    println(solve(a, b, m, as, bs, xs, ys, cs))
end

main()
