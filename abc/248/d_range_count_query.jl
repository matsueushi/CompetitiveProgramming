function solve(n, as, q, ls, rs, xs)
    mp = Dict{Int,Vector{Int}}()
    for i in 1:n
        if haskey(mp, as[i])
            push!(mp[as[i]], i)
        else
            mp[as[i]] = [i]
        end
    end
    for i in 1:q
        if haskey(mp, xs[i])
            st = searchsortedfirst(mp[xs[i]], ls[i])
            en = searchsortedfirst(mp[xs[i]], rs[i] + 1)
            println(en - st)
        else
            println(0)
        end
    end
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    q = parse(Int, readline())
    ls = zeros(Int, q)
    rs = zeros(Int, q)
    xs = zeros(Int, q)
    for i in 1:q
        ls[i], rs[i], xs[i] = parse.(Int, split(readline()))
    end
    solve(n, as, q, ls, rs, xs)
end

main()
