parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function count_number(xs)
    d = Dict{Int,Int}()
    for x in xs
        d[x] = get(d, x, 0) + 1
    end
    cs = [(v, k) for (k, v) in pairs(d)]
    sort(cs, rev=true)
end

function solve(n, vs)
    length(unique(vs)) == 1 && return n >> 1
    d_odd = count_number(view(vs, 1:2:n-1))
    d_even = count_number(view(vs, 2:2:n))
    v1, k1 = first(d_odd)
    v2, k2 = first(d_even)
    if k1 != k2
        n - v1 - v2
    elseif length(d_even) == 1
        v3, _ = d_odd[2]
        n - v2 - v3
    elseif length(d_odd) == 1
        v4, _ = d_even[2]
        n - v1 - v4
    else
        v3, _ = d_odd[2]
        v4, _ = d_even[2]
        min(n - v2 - v3, n - v1 - v4)
    end
end

function main()
    n = parseint()
    vs = parseints()
    println(solve(n, vs))
end

main()
