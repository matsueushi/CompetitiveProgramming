parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, as, bs)
    inds = sortperm(bs)
    as = as[inds]
    bs = bs[inds]
    cas = cumsum(as)
    all(cas .≤ bs)
end

function main()
    n = parseint()
    as, bs = parsepoints(n)
    println(ifelse(solve(n, as, bs), "Yes", "No"))
end

main()
