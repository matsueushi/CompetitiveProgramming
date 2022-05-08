function main()
    n = parse(Int, readline())
    ms = Char[]
    while n != 0
        if n & 1 != 0
            n -= 1
            push!(ms, 'A')
        else
            n >>= 1
            push!(ms, 'B')
        end
    end
    println(join(reverse(ms)))
end

main()
