const P = 998244353

parseints() = parse.(Int, split(readline()))

function solve(n, m, k)
    k == 0 && return powermod(m, n, P)
    current = zeros(Int, m)
    next = ones(Int, m)
    for i in 1:n-1
        current, next = next, current
        fill!(next, 0)

        cumsum_up = zeros(Int, m)
        cumsum_down = zeros(Int, m)
        cumsum_up[1] = first(current)
        cumsum_down[end] = last(current)

        for i in 1:m-1
            cumsum_up[i+1] = (cumsum_up[i] + current[i+1]) % P
            cumsum_down[end-i] = (cumsum_down[end-(i-1)] + current[end-i]) % P
        end

        for j in 1:m
            if j - k ≥ 1
                next[j] += cumsum_up[j-k]
            end
            if j + k ≤ m
                next[j] += cumsum_down[j+k]
            end
            next[j] %= P
        end
    end
    res = 0
    for x in next
        res = (res + x) % P
    end
    res
end

function main()
    n, m, k = parseints()
    println(solve(n, m, k))
end

main()
