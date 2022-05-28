parseints() = parse.(Int, split(readline()))

function solve(x, y)
    res = 0
    t = x
    while t ≤ y
        res += 1
        t <<= 1
    end
    res
end

function main()
    x, y = parseints()
    println(solve(x, y))
end

main()
