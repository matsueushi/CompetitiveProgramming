function main()
    s = readline()
    t = readline()
    x = collect(s) .- 'a'
    y = collect(t) .- 'a'
    d = y[1] - x[1]
    for i in 1:length(x)
        (x[i] + 26 + d) % 26 == y[i] || (println("No"); return)
    end
    println("Yes")
end

main()
