parseint() = parse(Int, readline())

function solve(n)
    dp = zeros(Int, 9, 9)
    for i in 1:n
        b = i % 10
        b == 0 && continue
        t = i
        while t ≥ 10
            t ÷= 10
        end
        dp[t, b] += 1
    end
    res = 0
    for i in 1:9
        for j in 1:9
            res += dp[i, j] * dp[j, i]
        end
    end
    res
end

function main()
    n = parseint()
    println(solve(n))
end

main()
