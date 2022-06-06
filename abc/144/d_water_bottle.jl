parseints() = parse.(Int, split(readline()))

function solve(a, b, x)
    if 2 * x ≥ a^2 * b
        atand(2 * (a^2 * b - x), a^3)
    else
        atand(a * b^2, 2 * x)
    end
end

function main()
    a, b, x = parseints()
    println(solve(a, b, x))
end

main()
