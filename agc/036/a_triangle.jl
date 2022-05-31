parseint() = parse(Int, readline())

const R = 10^9

sq(s, n) = s ≤ n * n

function solve(s)
    l, r = 0, R
    while r - l > 1
        m = (l + r) >> 1
        if sq(s, m)
            r = m
        else
            l = m
        end
    end
    rm = r * r - s
    r, ifelse(rm == 0, 0, 1), rm, r
end

function main()
    s = parseint()
    a1, a2, b1, b2 = solve(s)
    println("0 0 $a1 $a2 $b1 $b2")
end

main()
