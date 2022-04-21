function main()
    n = parse(Int, readline())
    a = n ÷ 100
    b = n ÷ 10 % 10
    c = n % 10
    println(111 * (a + b + c))
end

main()
