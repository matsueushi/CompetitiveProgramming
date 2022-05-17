function main()
    n = parse(Int, readline())
    xs = Tuple{String,Int,Int}[]
    for i in 1:n
        s, p = split(readline())
        push!(xs, (s, parse(Int, p), i))
    end
    sort!(xs, by=x -> (x[1], -x[2], x[3]))
    for i in 1:n
        println(xs[i][3])
    end
end

main()
