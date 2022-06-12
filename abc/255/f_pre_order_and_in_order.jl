parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function dfs!(pres, fidx, x, y, m, ls, rs)
    m == 0 && return true
    ind = fidx[x] - y + 1
    1 ≤ ind ≤ m || return false

    if ind != 1
        nl = ind - 1
        ls[pres[x]] = pres[x+1]
        !dfs!(pres, fidx, x + 1, y, nl, ls, rs) && return false
    end

    if ind != m
        nr = m - ind
        rs[pres[x]] = pres[x+ind]
        !dfs!(pres, fidx, x + ind, y + ind, nr, ls, rs) && return false
    end

    true
end

function solve(n, pres, ins)
    pres[1] == 1 || return nothing
    insidx = Dict(ins[i] => i for i in 1:n)
    fidx = [insidx[pres[i]] for i in 1:n]

    ls, rs = zeros(Int, n), zeros(Int, n)
    if dfs!(pres, fidx, 1, 1, n, ls, rs)
        return ls, rs
    end
end

function main()
    n = parseint()
    pres = parseints()
    ins = parseints()
    res = solve(n, pres, ins)
    if isnothing(res)
        println(-1)
    else
        ls, rs = res
        for (l, r) in zip(ls, rs)
            println("$l $r")
        end
    end
end

main()
