parseints() = parse.(Int, split(readline()))

function solve(n, a, b)
    iseven(b - a) && return (b - a) ÷ 2
    min((a - 1 + b - 1 + 1) ÷ 2, (n - a + n - b + 1) ÷ 2)
end

function main()
    n, a, b = parseints()
    println(solve(n, a, b))
end

main()
