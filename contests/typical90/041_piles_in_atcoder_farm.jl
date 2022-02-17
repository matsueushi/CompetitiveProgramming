det(x::Pair, y::Pair) = x.first * y.second - x.second * y.first
Base.:-(x::Pair, y::Pair) = (x.first - y.first) => (x.second - y.second)

function convexhull(n, ps)
    sort!(ps)
    k = 1
    qs = Vector{Pair{Int64,Int64}}(undef, 2 * n)
    for i in 1:n
        while k > 2 && det(qs[k-1] - qs[k-2], ps[i] - qs[k-1]) ≤ 0
            k -= 1
        end
        qs[k] = ps[i]
        k += 1
    end
    t = k
    for i in Iterators.reverse(1:n-1)
        while k > t && det(qs[k-1] - qs[k-2], ps[i] - qs[k-1]) ≤ 0
            k -= 1
        end
        qs[k] = ps[i]
        k += 1
    end
    qs[1:k-1]
end

function solve(n, ps)
    hull = convexhull(n, ps)
    nhull = length(hull)
    ar = zero(Int64)
    bd = 0
    for i in 1:nhull-1
        ix, iy = hull[i]
        jx, jy = hull[i+1]
        ar += (ix - jx) * (iy + jy)
        dx, dy = abs(ix - jx), abs(iy - jy)
        bd += gcd(dx, dy)
    end
    (ar + 2 + bd) ÷ 2 - n
end

function main()
    n = parse(Int64, readline())
    ps = Vector{Pair{Int64,Int64}}(undef, n)
    for i in 1:n
        ps[i] = Pair(parse.(Int64, split(readline()))...)
    end
    println(solve(n, ps))
end

main()
