function main()
    a, b, k = parse.(Int, split(readline()))
    n = 0
    while true
        a ≥ b && break
        n += 1
        a *= k
    end
    println(n)
end

main()
