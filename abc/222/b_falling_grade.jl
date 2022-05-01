function main()
    n, p = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    fall = 0
    for a in as
        a < p && (fall += 1)
    end
    println(fall)
end

main()
