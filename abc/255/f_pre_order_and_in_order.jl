parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function dfs!(pres, ins, x, y, m, ls, rs)
    m == 0 && return true
    ind = findfirst(isequal(pres[x]), view(ins, y:y+m-1))
    isnothing(ind) && return false

    if ind != 1
        nl = ind - 1
        ls[pres[x]] = pres[x+1]
        !dfs!(pres, ins, x + 1, y, nl, ls, rs) && return false
    end

    if ind != m
        nr = m - ind
        rs[pres[x]] = pres[x+ind]
        !dfs!(pres, ins, x + ind, y + ind, nr, ls, rs) && return false
    end

    true
end

function solve(n, pres, ins)
    pres[1] == 1 || return nothing
    ls, rs = zeros(Int, n), zeros(Int, n)
    if dfs!(pres, ins, 1, 1, n, ls, rs)
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
