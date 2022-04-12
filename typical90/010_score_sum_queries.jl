function score_sum(cs, ps, ls, rs)
    mask = cs .== 1
    cls1 = mask .* ps
    cls2 = .!(mask) .* ps
    pushfirst!(cls1, 0)
    pushfirst!(cls2, 0)
    ccum1 = cumsum(cls1)
    ccum2 = cumsum(cls2)
    as = zero(ls)
    bs = zero(rs)
    for i in 1:length(ls)
        st = ls[i]
        en = rs[i]
        a = ccum1[en+1] - ccum1[st]
        b = ccum2[en+1] - ccum2[st]
        as[i] = a
        bs[i] = b
    end
    as, bs
end

function main()
    n = parse.(Int64, readline())
    cs = zeros(Int64, n)
    ps = zeros(Int64, n)
    for i in 1:n
        cs[i], ps[i] = parse.(Int64, split(readline()))
    end
    q = parse.(Int64, readline())
    ls = zeros(Int64, q)
    rs = zeros(Int64, q)
    for i in 1:q
        ls[i], rs[i] = parse.(Int64, split(readline()))
    end
    as, bs = score_sum(cs, ps, ls, rs)
    for i = 1:q
        println("$(as[i]) $(bs[i])")
    end
end

main()
