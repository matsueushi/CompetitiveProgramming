parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, m, xs, ys)
    balls = ones(Int, n)
    red = falses(n)
    red[1] = true
    for (x, y) in zip(xs, ys)
        balls[x] -= 1
        balls[y] += 1
        red[x] && (red[y] = true)
        balls[x] == 0 && (red[x] = false)
    end
    res = 0
    for i in 1:n
        red[i] && (res += 1)
    end
    res
end

function main()
    n, m = parseints()
    xs, ys = parsepoints(m)
    println(solve(n, m, xs, ys))
end

main()
