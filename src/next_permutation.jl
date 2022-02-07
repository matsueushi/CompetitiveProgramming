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
