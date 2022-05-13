function main()
    n, m = parse.(Int, split(readline()))
    ks = zeros(Int, n)
    a = Vector{Int}[]
    for i in 1:n
        input = parse.(Int, split(readline()))
        ks[i] = input[1]
        push!(a, input[2:end])
    end
    loved = zeros(Int, m)
    for i in 1:n
        for j in 1:ks[i]
            loved[a[i][j]] += 1
        end
    end
    println(sum(loved .== n))
end

main()
