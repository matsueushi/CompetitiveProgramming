function main()
    n = parse(Int, readline())
    if n ≥ 5
        println("Yes")
    else
        println(2^n - n^2 > 0 ? "Yes" : "No")
    end
end

main()
