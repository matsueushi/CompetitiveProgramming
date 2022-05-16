function main()
    n = parse(Int, readline())
    d = Dict{String,Int}()
    m = 0
    for i in 1:n
        s = readline()
        v = get(d, s, 0) + 1
        d[s] = v
        m = max(m, v)
    end
    xs = [(v, k) for (k, v) in pairs(d)]
    sort!(xs, by=x -> (-x[1], x[2]))
    for (v, s) in xs
        v != m && break
        println(s)
    end

end

main()
