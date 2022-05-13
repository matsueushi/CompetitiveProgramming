function main()
    n, a, b = parse.(Int, split(readline()))
    x, r = divrem(n, a + b)
    println(x * a + min(r, a))
end

main()
