parseint() = parse(Int, readline())

function solve(n, ss, m, ts)
    d = Dict{String,Int}()
    for i in 1:n
        s = ss[i]
        d[s] = get(d, s, 0) + 1
    end
    for j in 1:m
        t = ts[j]
        d[t] = get(d, t, 0) - 1
    end
    res = 0
    for v in values(d)
        res = max(res, v)
    end
    res
end

function main()
    n = parseint()
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end

    m = parseint()
    ts = Vector{String}(undef, m)
    for j in 1:m
        ts[j] = readline()
    end
    println(solve(n, ss, m, ts))
end

main()
