parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7

const dx = [-1, 0, -1]
const dy = [0, -1, -1]

function solve(h, w, ss)
    dp = zeros(Int, h, w, 4)
    dp[1, 1, 4] = 1
    for i in 1:h
        for j in 1:w
            ss[i][j] == '.' || continue
            for k in 1:3
                i0 = i + dx[k]
                j0 = j + dy[k]
                (1 ≤ i0 ≤ h && 1 ≤ j0 ≤ w && ss[i0][j0] == '.') || continue
                dp[i, j, k] += dp[i0, j0, k] + dp[i0, j0, 4]
                dp[i, j, 4] += dp[i0, j0, k] + dp[i0, j0, 4]
            end

            for k in 1:4
                dp[i, j, k] %= P
            end
        end
    end
    dp[h, w, 4]
end

function main()
    h, w = parseints()
    ss = Vector{String}(undef, h)
    for i in 1:h
        ss[i] = readline()
    end
    println(solve(h, w, ss))
end

main()
