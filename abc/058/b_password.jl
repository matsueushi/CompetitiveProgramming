function main()
    od = readline()
    ev = readline()
    for i in 1:max(length(od), length(ev))
        if i ≤ length(od)
            print(od[i])
        end
        if i ≤ length(ev)
            print(ev[i])
        end
    end
    println()
end

main()
