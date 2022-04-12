function main()
    n = parse(Int64, readline())
    s = Set(2:2*n+1)
    println(1)
    flush(stdout)
    for _ in 1:n
        x = parse(Int64, readline())
        pop!(s, x)
        y = pop!(s)
        println(y)
        flush(stdout)
    end
end

main()
