function main()
    a, b, c, k = parse.(Int, split(readline()))
    println((-1)^k * (a - b))
end

main()
