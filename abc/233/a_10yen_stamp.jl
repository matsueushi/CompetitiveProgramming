function main()
    x, y = parse.(Int, split(readline()))
    println(fld1(max(y - x, 0), 10))
end

main()
