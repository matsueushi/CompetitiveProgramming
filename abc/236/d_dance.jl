struct Dance
    a::Matrix{Int}
    n::Int
    used::BitVector
    vs::Vector{NTuple{2,Int}}
end

Dance(a::Matrix{Int}, n::Int) = Dance(a, n, falses(2 * n), [])

function dance(d::Dance)
    if length(d.vs) == d.n
        ret = 0
        for (x, y) in d.vs
            ret ⊻= d.a[x, y]
        end
        return ret
    end

    l = 0
    for i in 1:2*d.n
        d.used[i] || (l = i; d.used[i] = true; break)
    end

    ret = 0
    for j in 1:2*d.n
        d.used[j] && continue
        d.used[j] = true
        push!(d.vs, (l, j))
        ret = max(ret, dance(d))
        pop!(d.vs)
        d.used[j] = false
    end
    d.used[l] = false
    ret
end

function solve(n, a)
    d = Dance(a, n)
    dance(d)
end

function main()
    n = parse(Int, readline())
    a = zeros(Int, 2 * n, 2 * n)
    for i in 1:2*n-1
        as = parse.(Int, split(readline()))
        for j in 1+i:2*n
            a[i, j] = as[j-i]
        end
    end
    println(solve(n, a))
end

main()
