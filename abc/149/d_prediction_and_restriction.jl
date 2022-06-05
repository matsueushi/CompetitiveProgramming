parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, k, r, s, p, t)
    res = 0
    for i in 1:k
        ti = t[i:k:end]
        dp = zeros(Int, length(ti) + 1, 3)
        for j in 1:length(ti)
            dp[j+1, 1] = max(dp[j, 2], dp[j, 3])
            dp[j+1, 2] = max(dp[j, 3], dp[j, 1])
            dp[j+1, 3] = max(dp[j, 1], dp[j, 2])
            if ti[j] == 'r'
                dp[j+1, 3] += p
            elseif ti[j] == 's'
                dp[j+1, 1] += r
            else
                dp[j+1, 2] += s
            end
        end
        res += maximum(dp[length(ti)+1, :])
    end
    res
end

function main()
    n, k = parseints()
    r, s, p = parseints()
    t = readline()
    println(solve(n, k, r, s, p, t))
end

main()
