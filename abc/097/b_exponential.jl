function main()
    table = Int[]
    for i in 1:32
        for j in 2:10
            x = i^j
            x ≤ 1000 || continue
            push!(table, x)
        end
    end
    sort!(table)
    unique!(table)
    x = parse(Int, readline())
    ind = searchsortedlast(table, x)
    println(table[ind])
end

main()
