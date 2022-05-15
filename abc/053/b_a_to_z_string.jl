function main()
    s = readline()
    ind_s = findfirst(==('A'), s)
    ind_t = findlast(==('Z'), s)
    println(ind_t - ind_s + 1)
end

main()
