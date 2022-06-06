parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(h, n, as, bs)
    dp = fill(typemax(Int), n + 1, h)
    for i in 1:n
        for k in 1:h
            x = k > as[i] ? dp[i+1, k-as[i]] : 0
            dp[i+1, k] = min(dp[i, k], x + bs[i])
        end
    end
    dp[n+1, h]
end

function main()
    h, n = parseints()
    as, bs = parsepoints(n)
    println(solve(h, n, as, bs))
end

main()
