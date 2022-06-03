parseints() = parse.(Int, split(readline()))

function solve(a, b, c)
    a + b ≥ c && return false
    4 * a * b < (c - a - b)^2
end

function main()
    a, b, c = parseints()
    println(ifelse(solve(a, b, c), "Yes", "No"))
end

main()
