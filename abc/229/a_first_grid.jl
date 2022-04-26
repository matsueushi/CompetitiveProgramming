function main()
    s1 = readline()
    s2 = readline()
    println((s1[1] == s2[2] == '.') || (s1[2] == s2[1] == '.') ? "No" : "Yes")
end

main()
