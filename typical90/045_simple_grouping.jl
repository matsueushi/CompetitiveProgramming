function solve(n, k, xs, ys)
    dist = zeros(Int64, n, n)
    for i in 1:n
        for j in i+1:n
            dist[i, j] = (xs[i] - xs[j])^2 + (ys[i] - ys[j])^2
        end
    end
    dmax = zeros(Int64, 2^n)
    for b in 0:2^n-1
        for i in 1:n
            for j in i+1:n
                if b & 1 << (i - 1) != 0 && b & 1 << (j - 1) != 0
                    dmax[b+1] = max(dmax[b+1], dist[i, j])
                end
            end
        end
    end
    dp = fill(typemax(Int64), 2^n, k)
    dp[:, 1] = dmax
    for i in 2:k
        for b in 0:2^n-1
            sub = b
            while true
                sub = (sub - 1) & b
                subd = max(dp[sub+1, i-1], dmax[b&~sub+1])
                dp[b+1, i] = min(dp[b+1, i], subd)
                sub == b && break
            end
        end
    end
    last(dp)
end

function main()
    n, k = parse.(Int64, split(readline()))
    xs = zeros(Int64, n)
    ys = zero(xs)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, k, xs, ys))
end

main()
