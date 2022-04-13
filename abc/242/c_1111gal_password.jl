const P = 998244353

function solve(n)
    dp2 = ones(Int64, 9)
    dp = zero(dp2)
    for i in 1:n-1
        dp, dp2 = dp2, dp
        fill!(dp2, 0)
        for j in 1:9
            for k in -1:1
                1 ≤ j + k ≤ 9 || continue
                dp2[j] += dp[j+k]
            end
            dp2[j] %= P
        end
    end
    sum(dp2) % P
end

function main()
    n = parse(Int64, readline())
    println(solve(n))
end

main()
