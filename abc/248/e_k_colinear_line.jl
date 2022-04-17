function solve(n, k, xs, ys)
    k == 1 && return typemax(Int)
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
            if haskey(lines, (a, b, c))
                lines[(a, b, c)] += 1
            else
                lines[(a, b, c)] = 1
            end
        end
    end
    c = k * (k - 1) ÷ 2
    res = 0
    for v in values(lines)
        v ≥ c && (res += 1)
    end
    res
end

function main()
    n, k = parse.(Int, split(readline()))
    xs = zeros(Int, n)
    ys = zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    ret = solve(n, k, xs, ys)
    println(ret == typemax(Int) ? "Infinity" : ret)
end

main()
