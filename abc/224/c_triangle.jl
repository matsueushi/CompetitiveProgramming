function solve(n, xs, ys)
    lines = Dict{NTuple{3,Int},Int}()
    for i in 1:n
        for j in i+1:n
            x0, y0, x1, y1 = xs[i], ys[i], xs[j], ys[j]
            a = y1 - y0
            b = -(x1 - x0)
            c = x1 * y0 - x0 * y1
            if a < 0 || (a == 0 && b < 0)
                a *= -1
                b *= -1
                c *= -1
            end
            g = gcd(a, b)
            a ÷= g
            b ÷= g
            c ÷= g
            lines[(a, b, c)] = get(lines, (a, b, c), 0) + 1
        end
    end
    res = n * (n - 1) * (n - 2) ÷ 6
    for v in values(lines)
        m = isqrt(2 * v) + 1
        m ≥ 3 && (res -= m * (m - 1) * (m - 2) ÷ 6)
    end
    res
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
