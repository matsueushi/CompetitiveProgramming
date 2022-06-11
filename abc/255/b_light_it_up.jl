parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, k, as, xs, ys)
    d = 0.0
    for i in 1:n
        di = Inf
        for a in as
            r = sqrt((xs[i] - xs[a])^2 + (ys[i] - ys[a])^2)
            di = min(di, r)
        end
        d = max(d, di)
    end
    d
end

function main()
    n, k = parseints()
    as = parseints()
    xs, ys = parsepoints(n)
    println(solve(n, k, as, xs, ys))
end

main()
