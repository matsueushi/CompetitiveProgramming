const P = 998244353

function solve(n, as)
    dp = zeros(Int, n, 10)
    dp[1, as[1]+1] = 1
    for i in 1:n-1
        for k in 0:9
            l0 = (k + as[i+1]) % 10
            dp[i+1, l0+1] += dp[i, k+1]
            dp[i+1, l0+1] %= P
            l1 = (k * as[i+1]) % 10
            dp[i+1, l1+1] += dp[i, k+1]
            dp[i+1, l1+1] %= P
        end
    end
    dp[n, :]
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(join(solve(n, as), "\n"))
end

main()
