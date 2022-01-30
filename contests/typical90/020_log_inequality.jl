function main()
    a, b, c = parse.(Int64, split(readline()))
    println(a < c^b ? "Yes" : "No")
end

main()
