parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, xs, ls)
    us = xs .- ls
    vs = xs .+ ls

    inds = sortperm(vs)
    us = us[inds]
    vs = vs[inds]

    res = 0
    r = -typemax(Int)

    for i in 1:n
        if us[i] ≥ r
            res += 1
            r = vs[i]
        end
    end
    res
end

function main()
    n = parseint()
    xs, ls = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ls[i] = parseints()
    end
    println(solve(n, xs, ls))
end

main()
