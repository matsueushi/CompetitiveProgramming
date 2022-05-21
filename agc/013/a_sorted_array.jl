parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))


function solve(n, as)
    dp = zeros(Int, n, 2)
    dp[1, :] .= 1
    for i in 2:n
        if as[i] < as[i-1]
            dp[i, 1] = min(dp[i-1, 1] + 1, dp[i-1, 2] + 1)
            dp[i, 2] = min(dp[i-1, 1] + 1, dp[i-1, 2])
        elseif as[i] == as[i-1]
            dp[i, :] = dp[i-1, :]
        else
            dp[i, 1] = min(dp[i-1, 1], dp[i-1, 2] + 1)
            dp[i, 2] = min(dp[i-1, 1] + 1, dp[i-1, 2] + 1)
        end
    end
    minimum(dp[n, :])
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
