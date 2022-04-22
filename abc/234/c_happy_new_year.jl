function main()
    k = parse(Int, readline())
    xs = Int[]
    for i in 0:60
        k >> i == 0 && break
        push!(xs, k >> i & 1 == 1 ? 2 : 0)
    end
    println(join(reverse(xs)))
end

main()
