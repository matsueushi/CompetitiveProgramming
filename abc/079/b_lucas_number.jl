function lucas(n)
    a, b = 2, 1
    for _ in 2:n
        a, b = b, a + b
    end
    b
end

function main()
    n = parse(Int, readline())
    println(lucas(n))
end

main()
