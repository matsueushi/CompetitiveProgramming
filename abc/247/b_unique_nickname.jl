function main()
    n = parse.(Int64, readline())
    ss = Vector{String}(undef, n)
    ts = Vector{String}(undef, n)
    sts = Dict{String,Int}()
    for i in 1:n
        s, t = split(readline())
        ss[i] = s
        ts[i] = t
        if haskey(sts, s)
            sts[s] += 1
        else
            sts[s] = 1
        end
        s == t && continue
        if haskey(sts, t)
            sts[t] += 1
        else
            sts[t] = 1
        end
    end
    for i in 1:n
        (sts[ss[i]] > 1 && sts[ts[i]] > 1) && (println("No"); return)
    end
    println("Yes")
end

main()
