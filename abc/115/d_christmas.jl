parseints() = parse.(Int, split(readline()))

const M = 50

function nps(x, k, ss, ps)
    k == 1 && return 1
    s = ss[k-1]
    p = ps[k-1]
    if x == 1
        return 0
    elseif x ≤ 1 + s
        return nps(x - 1, k - 1, ss, ps)
    elseif x == 2 + s
        return 1 + p
    elseif x ≤ 2 + 2 * s
        return 1 + p + nps(x - (2 + s), k - 1, ss, ps)
    else
        return ps[k]
    end
end

function solve(n, x)
    ss = zeros(Int, M + 1)
    ps = zeros(Int, M + 1)
    ps[1] = 1
    ss[1] = 1
    for i in 1:M
        ss[i+1] = 2 * ss[i] + 3
        ps[i+1] = 2 * ps[i] + 1
    end
    nps(x, n + 1, ss, ps)
end

function main()
    n, x = parseints()
    solve(n, x) |> println
end

main()
