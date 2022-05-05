function main()
    x = readline()
    mx = Dict{Char,Int}()
    for i in 1:26
        mx[x[i]] = i
    end
    n = parse(Int, readline())
    ss = String[]
    ts = String[]
    for i in 1:n
        s = readline()
        push!(ss, s)
        l = join(['a' + mx[c] - 1 for c in s])
        push!(ts, l)
    end
    idx = sortperm(ts)
    println(join(ss[idx], "\n"))
end

main()
