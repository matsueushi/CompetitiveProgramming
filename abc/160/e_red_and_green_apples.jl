parseints() = parse.(Int, split(readline()))

function solve(x, y, a, b, c, ps, qs, rs)
    vs = NTuple{2,Int}[]
    for p in ps
        push!(vs, (p, 1))
    end
    for q in qs
        push!(vs, (q, 2))
    end
    for r in rs
        push!(vs, (r, 3))
    end
    sort!(vs, rev=true)
    na = nb = nc = 0
    res = 0
    for (v, t) in vs
        if t == 1
            if na < x
                na += 1
                res += v
            end
        elseif t == 2
            if nb < y
                nb += 1
                res += v
            end
        else
            nc += 1
            res += v
        end
        na + nb + nc == x + y && break
    end
    res
end

function main()
    x, y, a, b, c = parseints()
    ps = parseints()
    qs = parseints()
    rs = parseints()
    println(solve(x, y, a, b, c, ps, qs, rs))
end

main()
