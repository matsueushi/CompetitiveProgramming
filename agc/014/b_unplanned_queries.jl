parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function solve(n, m, as, bs)
    flags = trues(n)
    for i in 1:m
        flags[as[i]] = !flags[as[i]]
        flags[bs[i]] = !flags[bs[i]]
    end
    for j in 1:n
        flags[j] || return false
    end
    true
end

function main()
    n, m = parseints()
    as, bs = parsepoints(m)
    ifelse(solve(n, m, as, bs), "YES", "NO") |> println
end

main()
