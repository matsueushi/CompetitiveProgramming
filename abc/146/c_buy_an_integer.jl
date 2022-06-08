parseints() = parse.(Int, split(readline()))

function len(x)
    d = 0
    while x > 0
        d += 1
        x ÷= 10
    end
    d
end

function solve(a, b, x)
    l, r = 0, 10^9 + 1
    while r - l > 1
        m = (l + r) >> 1
        if a * m + b * len(m) ≤ x
            l = m
        else
            r = m
        end
    end
    l
end

function main()
    a, b, x = parseints()
    println(solve(a, b, x))
end

main()
