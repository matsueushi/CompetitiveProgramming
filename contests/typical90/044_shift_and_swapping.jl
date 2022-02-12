function sas(n, as, ts, xs, ys)
    sidx = 1
    for (t, x, y) in zip(ts, xs, ys)
        if t == 1
            l = mod1(sidx - 1 + x, n)
            r = mod1(sidx - 1 + y, n)
            as[l], as[r] = as[r], as[l]
        elseif t == 2
            sidx = mod1(sidx - 1, n)
        else
            idx = mod1(sidx - 1 + x, n)
            println(as[idx])
        end
    end
end

function main()
    n, q = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    ts = zeros(Int64, q)
    xs = zeros(Int64, q)
    ys = zeros(Int64, q)
    for i in 1:q
        ts[i], xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    sas(n, as, ts, xs, ys)
end

main()
