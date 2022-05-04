function main()
    a, b = parse.(Int, split(readline()))
    println(32^(a - b))
end

main()
