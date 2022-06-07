parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7

function solve(n, m, as)
    broken = Set(as)
    dp = zeros(Int, n + 1)
    dp[1] = 1
    for i in 1:n
        i ∈ broken && continue
        dp[i+1] += dp[i]
        i ≥ 2 && (dp[i+1] += dp[i-1])
        dp[i+1] %= P
    end
    dp[n+1]
end

function main()
    n, m = parseints()
    as = zeros(Int, n)
    for i in 1:m
        as[i] = parseint()
    end
    println(solve(n, m, as))
end

main()
