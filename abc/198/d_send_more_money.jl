function next_permutation!(xs::Vector{T}) where {T}
    n = length(xs)
    left = 0
    for i in n-1:-1:1
        xs[i] < xs[i+1] && (left = i; break)
    end
    left == 0 && return false
    right = n
    for i in n:-1:left+1
        xs[i] > xs[left] && (right = i; break)
    end
    xs[left], xs[right] = xs[right], xs[left]
    reverse!(xs, left + 1, n)
    return true
end

function numrep(ps, x2)
    res = 0
    for i in 1:length(x2)
        d = ps[x2[i]]
        i == 1 && d == 0 && return nothing
        res *= 10
        res += d
    end
    res
end

function solve(a, b, c)
    cs = unique(Vector{Char}(a * b * c))
    length(cs) > 10 && return nothing

    cds = Dict(cs[i] => i for i in 1:length(cs))
    a2 = [cds[x] for x in a]
    b2 = [cds[x] for x in b]
    c2 = [cds[x] for x in c]

    ps = collect(0:9)
    while true
        na = numrep(ps, a2)
        nb = numrep(ps, b2)
        nc = numrep(ps, c2)
        if !isnothing(na) && !isnothing(nb) && !isnothing(nc) && na + nb == nc
            return na, nb, nc
        end
        next_permutation!(ps) || break
    end
    nothing
end

function main()
    a = readline()
    b = readline()
    c = readline()
    res = solve(a, b, c)
    if isnothing(res)
        println("UNSOLVABLE")
    else
        for x in res
            println(x)
        end
    end
end

main()
