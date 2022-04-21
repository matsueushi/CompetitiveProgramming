function main()
    n, q = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))

    pos = Dict{Int,Vector{Int}}()
    for i in 1:n
        if haskey(pos, as[i])
            push!(pos[as[i]], i)
        else
            pos[as[i]] = [i]
        end
    end
    for i in 1:q
        x, k = parse.(Int, split(readline()))
        if !haskey(pos, x)
            println(-1)
        elseif k ≤ length(pos[x])
            println(pos[x][k])
        else
            println(-1)
        end
    end
end

main()
