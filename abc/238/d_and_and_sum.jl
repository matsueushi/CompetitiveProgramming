function main()
    t = parse(Int, readline())
    for i in 1:t
        a, s = parse.(Int, split(readline()))
        if s - 2 * a ≥ 0 && iszero((s - 2 * a) & a)
            println("Yes")
        else
            println("No")
        end
    end
end

main()
