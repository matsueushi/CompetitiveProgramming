const P = 998244353

function solve(n, m, k)
    prev = zeros(Int, n * m)
    next = zeros(Int, n * m)
    next[1:m] .= 1
    for _ in 1:n-1
        prev, next = next, prev
        fill!(next, 0)
        for i in 1:k
            prev[i] > 0 || continue
            for j in 1:m
                i + j ≤ k || continue
                next[i+j] += prev[i]
                next[i+j] %= P
            end
        end
    end
    ret = 0
    for x in next
        ret += x
        ret %= P
    end
    ret
end

function main()
    n, m, k = parse.(Int, split(readline()))
    println(solve(n, m, k))
end

main()
