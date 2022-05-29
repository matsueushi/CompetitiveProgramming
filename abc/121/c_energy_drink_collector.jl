parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, m, as, bs)
    res = 0
    nds = m

    inds = sortperm(as)
    as = as[inds]
    bs = bs[inds]

    for i in 1:n
        x = min(nds, bs[i])
        nds -= x
        res += as[i] * x
        nds == 0 && break
    end
    res
end

function main()
    n, m = parseints()
    as, bs = parsepoints(n)
    println(solve(n, m, as, bs))
end

main()
