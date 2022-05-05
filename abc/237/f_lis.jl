const P = 998244353

function solve(n, m)
    minf = m + 1
    dp = zeros(Int, (n, m, minf, minf))
    for i in 1:m
        dp[1, i, minf, minf] = 1
    end

    for i in 1:n-1
        for j in 1:m
            for k in 1:minf
                j ≤ k || continue
                for l in 1:minf
                    k ≤ l || continue
                    dpijkl = dp[i, j, k, l]
                    for r in 1:m
                        if r ≤ j
                            dp[i+1, r, k, l] += dpijkl
                            dp[i+1, r, k, l] %= P
                        elseif r ≤ k
                            dp[i+1, j, r, l] += dpijkl
                            dp[i+1, j, r, l] %= P
                        elseif r ≤ l
                            dp[i+1, j, k, r] += dpijkl
                            dp[i+1, j, k, r] %= P
                        end
                    end
                end
            end
        end
    end
    res = 0
    for j in 1:m
        for k in 1:m
            for l in 1:m
                res += dp[n, j, k, l]
                res %= P
            end
        end
    end
    res
end

function main()
    n, m = parse.(Int, split(readline()))
    println(solve(n, m))
end

main()
