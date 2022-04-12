function solve(n, q, xs, ls, rs, vs)
    ws = diff(xs)
    s = sum(abs.(ws))
    for (l, r, v) in zip(ls, rs, vs)
        if l != 1
            w = ws[l-1]
            w2 = w + v
            ws[l-1] = w2
            s += abs(w2) - abs(w)
        end
        if r < n
            w = ws[r]
            w2 = w - v
            ws[r] = w2
            s += abs(w2) - abs(w)
        end
        println(s)
    end
end

function main()
    n, q = parse.(Int64, split(readline()))
    xs = parse.(Int64, split(readline()))
    ls = zeros(Int64, q)
    rs = zeros(Int64, q)
    vs = zeros(Int64, q)
    for i in 1:q
        ls[i], rs[i], vs[i] = parse.(Int64, split(readline()))
    end
    solve(n, q, xs, ls, rs, vs)
end

main()
