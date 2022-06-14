parseint() = parse(Int, readline())

function solve(n)
    ms = Int[]
    k = 1
    while 6 * k ≤ n
        k *= 6
        push!(ms, k)
    end
    k = 1
    while 9 * k ≤ n
        k *= 9
        push!(ms, k)
    end
    sort!(ms)

    dp = collect(0:n)
    for m in ms
        for x in 0:n-m
            dp[x+m+1] = min(dp[x+m+1], dp[x+1] + 1)
        end
    end
    dp[n+1]
end

function main()
    n = parseint()
    solve(n) |> println
end

main()
