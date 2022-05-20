function main()
    s = readline()
    t = readline()
    println(ifelse(join(sort(collect(s))) < join(sort(collect(t), rev=true)), "Yes", "No"))
end

main()
