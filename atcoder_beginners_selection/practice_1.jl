function main()
    lines = readlines()
    a = parse(Int64, lines[1])
    b, c = parse.(Int64, split(lines[2]))
    s = lines[3]
    println("$(a + b + c) $s")
end

main()