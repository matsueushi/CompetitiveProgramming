function main()
    n = parse(Int, readline())
    aset = Set{Int}()
    for i in 1:n
        a = parse(Int, readline())
        if a ∈ aset
            pop!(aset, a)
        else
            push!(aset, a)
        end
    end
    println(length(aset))
end

main()
