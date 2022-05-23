parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(q, h, s, d, n)
    dp = zeros(Int, 9)
    for i in 0:8
        dp[i+1] = i * q
    end
    for (k, v) in zip([2, 4, 8], [h, s, d])
        for j in 0:8-k
            dp[j+k+1] = min(dp[j+k+1], dp[j+1] + v)
        end
    end
    x, y = divrem(n * 4, 8)
    x * dp[9] + dp[y+1]
end

function main()
    q, h, s, d = parseints()
    n = parseint()
    println(solve(q, h, s, d, n))
end

main()
