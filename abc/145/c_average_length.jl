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
    res = 0
    for i in 1:n
        for j in i+1:n
            res += sqrt((xs[i] - xs[j])^2 + (ys[i] - ys[j])^2)
        end
    end
    2 * res / n
end

function main()
    n = parseint()
    xs, ys = parsepoints(n)
    println(solve(n, xs, ys))
end

main()
