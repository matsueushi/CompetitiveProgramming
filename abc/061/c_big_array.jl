parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, k, as, bs)
    d = Dict{Int,Int}()
    for i in 1:n
        d[as[i]] = get(d, as[i], 0) + bs[i]
    end
    xs = [(k, v) for (k, v) in pairs(d)]
    sort!(xs)
    m = k
    for (k, v) in xs
        v ≥ m && return k
        m -= v
    end
end

function main()
    n, k = parseints()
    as, bs = parsepoints(n)
    println(solve(n, k, as, bs))
end

main()
