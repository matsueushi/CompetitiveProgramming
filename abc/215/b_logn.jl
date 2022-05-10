function main()
    n = parse(Int, readline())
    i = 0
    while n > 0
        i += 1
        n >>= 1
    end
    println(i - 1)
end

main()
