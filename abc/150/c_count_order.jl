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

function solve(n, ps, qs)
    xs = collect(1:n)
    i = 0
    p = 0
    q = 0
    while true
        i += 1
        xs == ps && (p = i)
        xs == qs && (q = i)
        next_permutation!(xs) || break
    end
    abs(q - p)
end

function main()
    n = parse(Int, readline())
    ps = parse.(Int, split(readline()))
    qs = parse.(Int, split(readline()))
    println(solve(n, ps, qs))
end

main()
