function solve(n, xs, ys)
    sts, ens = Vector{Rational{Int}}(undef, n), Vector{Rational{Int}}(undef, n)
    for i in 1:n
        sts[i] = (ys[i] - 1) // xs[i]
        ens[i] = xs[i] == 1 ? typemax(Int) : ys[i] // (xs[i] - 1)
    end
    idx = sortperm(ens)
    sts = sts[idx]
    ens = ens[idx]
    t = 0
    ans = 0
    for i in 1:n
        if t ≤ sts[i]
            ans += 1
            t = ens[i]
        end
    end
    ans
end

function main()
    n = parse(Int, readline())
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    println(solve(n, xs, ys))
end

main()
