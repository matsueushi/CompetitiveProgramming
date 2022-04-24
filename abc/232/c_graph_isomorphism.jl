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

function solve(n, m, as, bs, cs, ds)
    gb = falses(n, n)
    for i in 1:m
        c, d = cs[i], ds[i]
        gb[c, d] = gb[d, c] = true
    end
    xs = collect(1:n)
    while true
        ok = true
        for i in 1:m
            ok &= gb[xs[as[i]], xs[bs[i]]]
        end
        ok && return true
        next_permutation!(xs) || break
    end
    false
end

function main()
    n, m = parse.(Int, split(readline()))
    as = zeros(Int, m)
    bs = zero(as)
    cs = zero(as)
    ds = zero(as)
    for i in 1:m
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    for i in 1:m
        cs[i], ds[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, as, bs, cs, ds) ? "Yes" : "No")
end

main()
