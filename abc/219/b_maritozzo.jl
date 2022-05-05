function main()
    s = String[]
    for i in 1:3
        push!(s, readline())
    end
    t = readline()
    for x in t
        nx = parse(Int, x)
        print(s[nx])
    end
    println()
end

main()
