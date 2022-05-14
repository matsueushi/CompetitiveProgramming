function solve(n, ss, ts)
    sub = 0
    score = 0
    poems = Set{String}()
    for i in 1:n
        ss[i] ∈ poems && continue
        push!(poems, ss[i])
        if score < ts[i]
            sub = i
            score = ts[i]
        end
    end
    sub
end

function main()
    n = parse(Int, readline())
    ss, ts = Vector{String}(undef, n), zeros(Int, n)
    for i in 1:n
        s, t = split(readline())
        ss[i] = s
        ts[i] = parse(Int, t)
    end
    println(solve(n, ss, ts))
end

main()
