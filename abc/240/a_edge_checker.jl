function main()
    a, b = parse.(Int64, split(readline()))
    println((b - a == 1 || b - a == 9) ? "Yes" : "No")
end

main()
