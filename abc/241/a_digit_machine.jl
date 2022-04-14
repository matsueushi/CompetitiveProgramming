function main()
    as = parse.(Int64, split(readline()))
    as .+= 1
    println(as[as[as[1]]] - 1)
end

main()
