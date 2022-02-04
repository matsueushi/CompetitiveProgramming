function main()
    a, b, c = parse.(Int64, split(readline()))
    g = gcd(a, b, c)
    println(a ÷ g + b ÷ g + c ÷ g - 3)
end

main()
