function main()
    x = Set{Int64}()
    y = Set{Int64}()
    for i in 1:3
        u, v = parse.(Int64, split(readline()))
        if u ∈ x
            pop!(x, u)
        else
            push!(x, u)
        end
        if v ∈ y
            pop!(y, v)
        else
            push!(y, v)
        end
    end
    println("$(only(x)) $(only(y))")
end

main()
