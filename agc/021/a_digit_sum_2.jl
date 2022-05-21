parseint() = parse(Int, readline())

function solve(n)
    x = 0
    i = 0
    while 10 * x + 9 ≤ n
        x *= 10
        x += 9
        i += 1
    end
    x == n && return i * 9
    l = n ÷ 10^i
    (n + 1) % 10^i == 0 && return l + i * 9
    l - 1 + i * 9
end

function main()
    n = parseint()
    println(solve(n))
end

main()
