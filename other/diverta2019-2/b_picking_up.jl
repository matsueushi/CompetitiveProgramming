parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, xs, ys)
    points = Set(zip(xs, ys))
    res = n
    for i in 1:n
        for j in 1:n
            i == j && continue
            res0 = n
            dx = xs[i] - xs[j]
            dy = ys[i] - ys[j]
            for k in 1:n
                x, y = xs[k] + dx, ys[k] + dy
                (x, y) ∈ points && (res0 -= 1)
            end
            res = min(res, res0)
        end
    end
    res
end

function main()
    n = parseint()
    xs, ys = parsepoints(n)
    println(solve(n, xs, ys))
end

main()
