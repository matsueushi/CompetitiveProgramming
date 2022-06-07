parseint() = parse(Int, readline())

function solve(n)
    l = 0
    r = 10^4
    while r > l + 1
        m = (r + l) >> 1
        if m * (m + 1) ÷ 2 < n
            l = m
        else
            r = m
        end
    end
    x = r * (r + 1) ÷ 2
    y = x - n
    [i for i in 1:r if i != y]
end

function main()
    n = parseint()
    for i in solve(n)
        println(i)
    end
end

main()
