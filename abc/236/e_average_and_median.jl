function ave(n, as, k)
    dp = zeros(n, 2)
    dp[1, 1] = as[1] - k
    dp[1, 2] = 0.0
    for i in 1:n-1
        dp[i+1, 1] = max(dp[i, 1], dp[i, 2]) + as[i+1] - k
        dp[i+1, 2] = dp[i, 1]
    end
    maximum(dp[n, :])
end

function solve_average(n, as)
    l = 1
    r = 10^9
    while r - l > 10^(-4)
        m = (r + l) / 2
        if ave(n, as, m) ≥ 0.0
            l = m
        else
            r = m
        end
    end
    l
end

function med(n, as, k)
    dp = zeros(Int, n, 2)
    dp[1, 1] = as[1] ≥ k ? 1 : -1
    dp[1, 2] = 0
    for i in 1:n-1
        dp[i+1, 1] = max(dp[i, 1], dp[i, 2]) + (as[i+1] ≥ k ? 1 : -1)
        dp[i+1, 2] = dp[i, 1]
    end
    maximum(dp[n, :])
end

function solve_median(n, as)
    l = 1
    r = 10^9 + 1
    while r - l > 1
        m = (r + l) ÷ 2
        if med(n, as, m) > 0
            l = m
        else
            r = m
        end
    end
    l
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(solve_average(n, as))
    println(solve_median(n, as))
end

main()
