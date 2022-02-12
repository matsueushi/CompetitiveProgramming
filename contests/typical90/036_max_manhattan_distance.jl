function manhattan(xs, ys, qs)
    zs = xs .+ ys
    ws = xs .- ys
    minzs, maxzs = extrema(zs)
    minws, maxws = extrema(ws)
    as = Int64[]
    for q in qs
        z = zs[q]
        w = ws[q]
        push!(as, max(abs(z - minzs), abs(z - maxzs), abs(w - minws), abs(w - maxws)))
    end
    as
end

function main()
    n, q = parse.(Int64, split(readline()))
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    qs = zeros(Int64, q)
    for i in 1:q
        qs[i] = parse(Int64, readline())
    end
    println(join(manhattan(xs, ys, qs), "\n"))
end

main()