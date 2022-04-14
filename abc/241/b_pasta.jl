function main()
    n, m = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    ps = Dict{Int64,Int64}()
    for a in as
        if haskey(ps, a)
            ps[a] += 1
        else
            ps[a] = 1
        end
    end
    for b in bs
        if haskey(ps, b) && ps[b] > 0
            ps[b] -= 1
        else
            println("No")
            return
        end
    end
    println("Yes")
end

main()
