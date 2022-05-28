parseint() = parse(Int, readline())

function solve(x)
    l, u = 0, 10^9
    while u - l > 1
        m = (l + u) ÷ 2
        if m * (m + 1) ÷ 2 ≥ x
            u = m
        else
            l = m
        end
    end
    u
end

function main()
    x = parseint()
    println(solve(x))
end

main()
