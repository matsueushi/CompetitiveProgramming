function main()
    n, x = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    used = falses(n)
    i = x
    c = 0
    while !used[i]
        used[i] = true
        i = as[i]
        c += 1
    end
    println(c)
end

main()
