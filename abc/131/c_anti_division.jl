parseints() = parse.(Int, split(readline()))

function solve(a, b, c, d)
    res = b - a + 1
    l = lcm(c, d)
    res -= b ÷ c
    res -= b ÷ d
    res += b ÷ l
    res += (a - 1) ÷ c
    res += (a - 1) ÷ d
    res -= (a - 1) ÷ l
    res
end

function main()
    a, b, c, d = parseints()
    println(solve(a, b, c, d))
end

main()
