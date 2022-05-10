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

function main()
    s, rk = split(readline())
    k = parse(Int, rk)
    ss = String[]
    ord = collect(1:length(s))
    while true
        push!(ss, join(s[i] for i in ord))
        next_permutation!(ord) || break
    end
    sort!(ss)
    unique!(ss)
    println(ss[k])
end

main()
