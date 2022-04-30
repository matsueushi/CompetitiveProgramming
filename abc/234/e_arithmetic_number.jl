function main()
    numbers = Int[]
    for s in 1:9
        push!(numbers, s)
        for d in -9:9
            t = s
            n = s
            for i in 1:18
                t += d
                0 ≤ t ≤ 9 || break
                n *= 10
                n += t
                n < 0 && break
                push!(numbers, n)
            end
        end
    end
    sort!(numbers)

    x = parse(Int, readline())
    i = searchsortedfirst(numbers, x)
    println(numbers[i])
end

main()
