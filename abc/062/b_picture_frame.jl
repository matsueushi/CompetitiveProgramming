function main()
    h, w = parse.(Int, split(readline()))
    println('#'^(w + 2))
    for i in 1:h
        s = readline()
        println('#' * s * '#')
    end
    println('#'^(w + 2))
end

main()
