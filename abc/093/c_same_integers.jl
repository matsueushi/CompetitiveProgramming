parseints() = parse.(Int, split(readline()))

function solve(a, b, c)
    a, b, c = sort([a, b, c])
    res = 0
    x = (b - a) >> 1
    res += x
    a += x << 1
    b != a && (res += 2)
    res += c - b
    res
end

function main()
    a, b, c = parseints()
    println(solve(a, b, c))
end

main()
