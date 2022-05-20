parseints() = parse.(Int, split(readline()))

function solve(d, g, ps, cs)
    res = typemax(Int)
    for i in 0:1<<d-1
        ires = 0
        need = g
        for j in 1:d
            if i >> (j - 1) & 1 == 1
                ires += ps[j]
                need -= ps[j] * j * 100 + cs[j]
            end
        end
        for j in d:-1:1
            need ≤ 0 && break
            if i >> (j - 1) & 1 == 0
                m = min(ps[j] - 1, need ÷ (j * 100))
                ires += m
                need -= m * j * 100
            end
        end
        if need ≤ 0
            res = min(res, ires)
        end
    end
    res
end

function main()
    d, g = parseints()
    ps, cs = zeros(Int, d), zeros(Int, d)
    for i in 1:d
        ps[i], cs[i] = parseints()
    end
    println(solve(d, g, ps, cs))
end

main()
