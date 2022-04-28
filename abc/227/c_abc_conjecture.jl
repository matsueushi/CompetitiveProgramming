function main()
    n = parse(Int, readline())
    res = 0
    for i in 1:n
        i * i * i > n && break
        for j in i:n
            i * j * j > n && break
            x = n ÷ (i * j)
            res += x - j + 1
        end
    end
    println(res)
end

main()
