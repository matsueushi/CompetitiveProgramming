function main()
    lines = readlines()
    n = parse(Int64, lines[1])
    mochis = parse.(Int64, lines[2:n+1])
    println(length(Set(mochis)))
end

main()