function main()
    s = readline()
    println(length(Set(split(s, ""))) == length(s) ? "yes" : "no")
end

main()
