function main()
    a, b = parse.(Int64, split(readline()))
    println(isodd(a) && isodd(b) ? "Odd" : "Even")
end

main()