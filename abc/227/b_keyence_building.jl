function main()
    n = parse(Int, readline())
    ss = parse.(Int, split(readline()))
    xs = Set{Int}()
    for i in 1:334
        for j in 1:i
            push!(xs, 4 * i * j + 3 * i + 3 * j)
        end
    end
    res = 0
    for i in 1:n
        ss[i] ∉ xs && (res += 1)
    end
    println(res)
end

main()
