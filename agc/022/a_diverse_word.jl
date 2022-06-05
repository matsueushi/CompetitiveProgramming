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

function solve(s)
    s == "zyxwvutsrqponmlkjihgfedcba" && return -1
    if length(s) == 26
        t = Vector{Char}(s)
        next_permutation!(t)
        for i in 1:26
            s[i] != t[i] && return join(t[1:i])
        end
    end
    used = falses(26)
    for c in s
        used[c-'a'+1] = true
    end
    for i in 1:26
        used[i] || return s * ('a' + i - 1)
    end
end

function main()
    s = readline()
    println(solve(s))
end

main()
