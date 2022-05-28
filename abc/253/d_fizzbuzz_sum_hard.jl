parseints() = parse.(Int, split(readline()))

function sub(n, x)
    c = n ÷ x
    x * c * (c + 1) ÷ 2
end

function solve(n, a, b)
    res = n * (n + 1) ÷ 2
    res - sub(n, a) - sub(n, b) + sub(n, lcm(a, b))
end

function main()
    n, a, b = parseints()
    println(solve(n, a, b))
end

main()
