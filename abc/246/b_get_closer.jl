function main()
    a, b = parse.(Int64, split(readline()))
    r = sqrt(a^2 + b^2)
    a0, b0 = a / r, b / r
    println("$a0 $b0")
end

main()
