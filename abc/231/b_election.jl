function main()
    n = parse(Int, readline())
    count = Dict{String,Int}()
    for i in 1:n
        s = readline()
        count[s] = get(count, s, 0) + 1
    end
    name = ""
    vote = -1
    for (k, v) in pairs(count)
        if v > vote
            vote = v
            name = k
        end
    end
    println(name)
end

main()
