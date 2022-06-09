parseints() = parse.(Int, split(readline()))

function solve(n, m)
    res = 0
    for x in 1:isqrt(m)
        m % x != 0 && continue
        if x * n ≤ m
            res = max(res, x)
        end
        y = m ÷ x
        if y * n ≤ m
            res = max(res, y)
        end
    end
    res
end

function main()
    n, m = parseints()
    println(solve(n, m))
end

main()
