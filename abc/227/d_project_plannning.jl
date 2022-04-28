function choose(c, n, k, as)
    pj = 0
    mem = 0
    for i in 1:n
        if as[i] ≥ c
            pj += 1
        elseif as[i] ≥ c - mem
            pj += 1
            mem = as[i] - (c - mem)
        else
            mem += as[i]
        end
        pj == k && return true
    end
    false
end

function solve(n, k, as)
    sort!(as, rev=true)
    l = 0
    r = sum(as) ÷ k + 1
    while r - l > 1
        m = (l + r) ÷ 2
        if choose(m, n, k, as)
            l = m
        else
            r = m
        end
    end
    l
end

function main()
    n, k = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, k, as))
end

main()
