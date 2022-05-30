parseints() = parse.(Int, split(readline()))

function solve(n, p, as)
    dp = zeros(Int, n + 1, 2)
    dp[0+1, 0+1] = 1
    for i in 1:n
        dp[i+1, 0+1] = dp[i, 0+1] + dp[i, isodd(as[i])+1]
        dp[i+1, 1+1] = dp[i, 1+1] + dp[i, iseven(as[i])+1]
    end
    dp[n+1, p+1]
end

function main()
    n, p = parseints()
    as = parseints()
    println(solve(n, p, as))
end

main()
