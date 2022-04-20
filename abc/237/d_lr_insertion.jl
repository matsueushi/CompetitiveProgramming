function main()
    n = parse(Int, readline())
    s = readline()
    head = Int[]
    tail = Int[]
    for i in 1:n
        if s[i] == 'R'
            push!(head, i - 1)
        else
            push!(tail, i - 1)
        end
    end
    res = vcat(head, [n], reverse(tail))
    println(join(res, " "))
end

main()
