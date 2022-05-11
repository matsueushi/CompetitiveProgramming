function main()
    a, b = split(readline())
    x = parse(Int, join([a, b]))
    sx = isqrt(x)
    println(x == sx * sx ? "Yes" : "No")
end

main()
