function solve(n, x, y, as, bs)
    dp = fill(1000, (x + 1, y + 1, n + 1))
    dp[1, 1, :] .= 0
    for i in 1:n
        for j in 0:x
            for k in 0:y
                x0 = max(j - as[i], 0)
                y0 = max(k - bs[i], 0)
                dp[j+1, k+1, i+1] = min(dp[j+1, k+1, i+1], dp[j+1, k+1, i], dp[x0+1, y0+1, i] + 1)
            end
        end
    end
    dp[x+1, y+1, n+1] == 1000 ? -1 : dp[x+1, y+1, n+1]
end

function main()
    n = parse(Int, readline())
    x, y = parse.(Int, split(readline()))
    as, bs = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        as[i], bs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, x, y, as, bs))
end

main()
