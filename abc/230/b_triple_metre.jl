function main()
    t = repeat("oxx", 10)
    s = readline()
    n = length(s)
    for i in 1:3
        if s == t[i:i+n-1]
            println("Yes")
            return
        end
    end
    println("No")
end

main()
