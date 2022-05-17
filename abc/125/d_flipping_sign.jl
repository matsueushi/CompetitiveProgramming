function solve(n, as)
    dp = zeros(Int, n - 1, 2)
    dp[1, 1] = as[1] + as[2]
    dp[1, 2] = -dp[1, 1]
    for i in 2:n-1
        dp[i, 1] = max(dp[i-1, 1], dp[i-1, 2]) + as[i+1]
        dp[i, 2] = max(dp[i-1, 1] - 2 * as[i] - as[i+1], dp[i-1, 2] + 2 * as[i] - as[i+1])
    end
    maximum(dp[n-1, :])
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(solve(n, as))
end

main()
