function solve(s)
    c = first(s)
    l = 1
    vs = Int[]
    cs = Char[]
    n = length(s)
    for i in 2:n
        if s[i] != c
            push!(vs, l)
            push!(cs, c)
            c = s[i]
            l = 0
        end
        l += 1
    end
    push!(vs, l)
    push!(cs, c)

    res = 0
    m = length(vs)
    for i in 1:m
        res += vs[i] * (vs[i] + 1) ÷ 2
        if i > 1 && cs[i] == '>'
            if vs[i] > vs[i-1]
                res -= vs[i-1]
            else
                res -= vs[i]
            end
        end
    end
    res
end

function main()
    s = readline()
    println(solve(s))
end

main()
