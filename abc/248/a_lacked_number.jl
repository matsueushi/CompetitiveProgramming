function main()
    s = readline()
    ss = parse.(Int, collect(s))
    println(45 - sum(ss))
end

main()
