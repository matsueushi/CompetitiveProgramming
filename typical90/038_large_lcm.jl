function main()
    a, b = parse.(Int64, split(readline()))
    c = gcd(a, b)
    a0 = a ÷ c
    x = 10^18 ÷ b
    println(a0 ≤ x ? a0 * b : "Large")
end

main()
