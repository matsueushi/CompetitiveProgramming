function main()
    a, b = parse.(Int, split(readline()))
    println(cld(b - 1, a - 1))
end

main()
