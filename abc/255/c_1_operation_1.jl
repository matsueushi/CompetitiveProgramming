parseints() = parse.(Int, split(readline()))

function solve(x, a, d, n)
    d == 0 && return abs(x - a)
    if (d > 0 && x - a < 0) || (d < 0 && x - a > 0)
        return abs(x - a)
    elseif (d > 0 && x - a > d * (n - 1)) || (d < 0 && x - a < d * (n - 1))
        return abs(x - (a + d * (n - 1)))
    else
        up, dw = cld(x - a, d), fld(x - a, d)
        r1 = abs(x - (a + d * up))
        r2 = abs(x - (a + d * dw))
        return min(r1, r2)
    end
end

function main()
    x, a, d, n = parseints()
    println(solve(x, a, d, n))
end

main()
