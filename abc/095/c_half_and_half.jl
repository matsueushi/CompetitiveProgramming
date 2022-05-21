parseints() = parse.(Int, split(readline()))

function main()
    a, b, c, x, y = parseints()
    xymin = min(x, y)
    res = min(a + b, 2 * c) * xymin
    res += (x - xymin) * min(a, 2 * c)
    res += (y - xymin) * min(b, 2 * c)
    println(res)
end

main()
