function solve(n, m, cs, ls, rs)
    ix = sortperm(cs)
    cs = cs[ix]
    ls = ls[ix]
    rs = rs[ix]
    score = 0
    rx = 0
    for i in 1:n
        found = false
        for j in 1:m
            (i < ls[j] || rs[j] < i) && continue
            if !found
                found = true
                score += cs[j]
                rx = rs[j]
            end

            if rs[j] ≤ rx
                ls[j] = rs[j] + 1
                rs[j] = rx
            else
                ls[j] = rx + 1
            end
        end
        !found && return -1
    end
    score
end

function main()
    n, m = parse.(Int64, split(readline()))
    cs = zeros(Int64, m)
    ls = zeros(Int64, m)
    rs = zeros(Int64, m)
    for i in 1:m
        cs[i], ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, m, cs, ls, rs))
end

main()
