function main()
    ts = zeros(Int, 5)
    ws = zeros(Int, 5)
    for i in 1:5
        t = parse(Int, readline())
        ts[i] = t
        ws[i] = t % 10 == 0 ? 0 : 10 - t % 10
    end
    inds = sortperm(ws, rev=true)
    ts = ts[inds]
    ws = ws[inds]
    res = first(ts)
    for i in 2:5
        res += cld(ts[i], 10) * 10
    end
    println(res)
end

main()
