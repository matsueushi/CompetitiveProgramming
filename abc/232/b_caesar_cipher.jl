function main()
    s = readline()
    t = readline()
    d = t[1] - s[1]
    println(String(collect(s) .+ d) == t ? "Yes" : "No")
end

main()
