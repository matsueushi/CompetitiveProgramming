parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const EMAX = 100 + 10

function solve(n, k)
    dp = zeros(Int, EMAX, 4, 2)
    c = parse(Int, n[1])
    dp[:, 1, 1] .= 1
    dp[1, 2, 1] = c - 1
    dp[1, 2, 2] = 1
    nlen = length(n)
    for i in 1:nlen-1
        c = parse(Int, n[i+1])
        for j in 1:3
            dp[i+1, j+1, 1] = dp[i, j+1, 1] + 9 * dp[i, j, 1]
            if c != 0
                dp[i+1, j+1, 1] += dp[i, j+1, 2] + (c - 1) * dp[i, j, 2]
            end

            dp[i+1, j+1, 2] = ifelse(c == 0, dp[i, j+1, 2], dp[i, j, 2])
        end
    end
    dp[nlen, k+1, 1] + dp[nlen, k+1, 2]
end

function main()
    n = readline()
    k = parseint()
    println(solve(n, k))
end

main()
