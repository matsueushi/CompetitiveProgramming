function main()
    n, m, x = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    ind = searchsortedlast(as, x)
    println(min(ind, m - ind))
end

main()
