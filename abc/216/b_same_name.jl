function main()
    n = parse.(Int, readline())
    nset = Set{Pair{String,String}}()
    for i in 1:n
        s, t = split(readline())
        push!(nset, s => t)
    end
    println(n == length(nset) ? "No" : "Yes")
end

main()
