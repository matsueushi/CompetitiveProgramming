parseints() = parse.(Int, split(readline()))

function main()
    n, m = parseints()
    res = 1900 * m + 100 * (n - m)
    res *= 2^m
    println(res)
end

main()
