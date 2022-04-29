function solve(n, xs, ys)
    magic = Set{Pair{Int,Int}}()
    for i in 1:n
        for j in 1:n
            i == j && continue
            x0, y0 = xs[i], ys[i]
            x1, y1 = xs[j], ys[j]
            dx = x1 - x0
            dy = y1 - y0
            g = gcd(dx, dy)
            push!(magic, dx ÷ g => dy ÷ g)
        end
    end
    length(magic)
end

function main()
    n = parse(Int, readline())
    xs = zeros(Int, n)
    ys = zero(xs)
    for i in 1:n
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    println(solve(n, xs, ys))
end

main()
