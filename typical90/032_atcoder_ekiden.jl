function next_permutation!(xs::Vector{T}) where {T}
    n = length(xs)
    left = 0
    for i in Iterators.reverse(1:n-1)
        xs[i] < xs[i+1] && (left = i; break)
    end
    left == 0 && return false
    right = n
    for i in Iterators.reverse(left+1:n)
        xs[i] > xs[left] && (right = i; break)
    end
    xs[left], xs[right] = xs[right], xs[left]
    reverse!(xs, left + 1, n)
    return true
end

function is_valid_perm(xs, ng)
    for i in 1:length(xs)-1
        xs[i+1] in ng[xs[i]] && return false
    end
    true
end

function ekiden(n, a, m, xs, ys)
    ng = [Set{Int64}() for _ in 1:n]
    for i in 1:m
        x, y = xs[i], ys[i]
        push!(ng[x], y)
        push!(ng[y], x)
    end

    xs = collect(1:n)
    score = -1
    while true
        if is_valid_perm(xs, ng)
            sc = 0
            for i in 1:n
                sc += a[xs[i], i]
            end
            score = score == -1 ? sc : min(score, sc)
        end
        next_permutation!(xs) || break
    end
    score
end

function main()
    n = parse(Int64, readline())
    a = zeros(Int64, (n, n))
    for i in 1:n
        a[i, :] = parse.(Int64, split(readline()))
    end
    m = parse(Int64, readline())
    xs = zeros(Int64, m)
    ys = zeros(Int64, m)
    for i in 1:m
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(ekiden(n, a, m, xs, ys))
end

main()
