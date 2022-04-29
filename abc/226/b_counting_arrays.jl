function main()
    n = parse(Int, readline())
    lset = Set{Vector{Int}}()
    for i in 1:n
        push!(lset, parse.(Int, split(readline())))
    end
    println(length(lset))
end

main()
