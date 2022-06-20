parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const P = 998244353
const M = 3000

function solve(n, as, bs)
    curr = zeros(Int, M + 1) # 0,1,...,M
    next = zeros(Int, M + 1)
    for i in as[1]:bs[1]
        curr[i+1] = i - as[1] + 1
    end
    for i in bs[1]+1:M
        curr[i+1] = curr[i]
    end
    for j in 2:n
        fill!(next, 0)
        for i in as[j]:bs[j]
            if i ≥ 1
                next[i+1] = next[i-1+1]
            end
            next[i+1] += curr[i+1]
            next[i+1] = next[i+1] % P
        end
        for i in bs[j]+1:M
            next[i+1] = next[i]
        end
        curr, next = next, curr
    end
    curr[bs[n]+1]
end

function main()
    n = parseint()
    as = parseints()
    bs = parseints()
    solve(n, as, bs) |> println
end

main()
