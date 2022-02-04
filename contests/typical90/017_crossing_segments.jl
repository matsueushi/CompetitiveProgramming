function crossing(n, ls, rs)
    idx = sortperm(rs)
    ls = ls[idx]
    rs = rs[idx]
    midcount = zeros(Int64, n)
    midcount_current = zeros(Int64, n)
    r_current = first(rs)
    crosses = 0
    for (l, r) in zip(ls, rs)
        if r_current != r
            r_current = r
            midcount += midcount_current
            fill!(midcount_current, 0)
        end
        crosses += midcount[l]
        midcount_current[l+1:r-1] .+= 1
    end
    crosses
end

function main()
    n, m = parse.(Int64, split(readline()))
    ls = zeros(Int64, m)
    rs = zeros(Int64, m)
    for i in 1:m
        ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    println(crossing(n, ls, rs))
end

main()
