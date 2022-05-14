function solve(n, as)
    res = sum(as)

    dp = zeros(Int, 2, 2, n)
    # 1 : drop, 2 : use
    dp[1, 1, 1] = as[1]
    for i in 1:n-1
        for k in 1:2
            dp[k, 1, i+1] = dp[k, 2, i] + as[i+1]
            dp[k, 2, i+1] = max(dp[k, 1, i], dp[k, 2, i])
        end
    end

    dct = max(dp[1, 2, n], dp[2, 1, n], dp[2, 2, n])
    res - dct
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(solve(n, as))
end

main()
