const P = 998244353

function solve(h, w, k, x1, y1, x2, y2)
    dp = zeros(Int, 4, k + 1)
    dp[1, 1] = 1
    for i in 1:k
        dp[1, i+1] = ((h - 1) * dp[2, i] + (w - 1) * dp[3, i]) % P
        dp[2, i+1] = (dp[1, i] + (h - 2) * dp[2, i] + (w - 1) * dp[4, i]) % P
        dp[3, i+1] = (dp[1, i] + (w - 2) * dp[3, i] + (h - 1) * dp[4, i]) % P
        dp[4, i+1] = (dp[2, i] + dp[3, i] + (h - 2 + w - 2) * dp[4, i]) % P
    end
    if x1 == x2 && y1 == y2
        dp[1, k+1]
    elseif y1 == y2
        dp[2, k+1]
    elseif x1 == x2
        dp[3, k+1]
    else
        dp[4, k+1]
    end
end

function main()
    h, w, k = parse.(Int, split(readline()))
    x1, y1, x2, y2 = parse.(Int, split(readline()))
    println(solve(h, w, k, x1, y1, x2, y2))
end

main()
