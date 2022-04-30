function main()
    x = parse(Int, readline())
    println((x ≥ 100 && x % 100 == 0) ? "Yes" : "No")
end

main()
