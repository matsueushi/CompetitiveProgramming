function score_sum(cps, lrs)
    mask = cps[1, :] .== 1
    cls1 = mask .* cps[2, :]
    cls2 = .!(mask) .* cps[2, :]
    pushfirst!(cls1, 0)
    pushfirst!(cls2, 0)
    ans = Vector{Pair{Int64,Int64}}()
    ccum1 = cumsum(cls1)
    ccum2 = cumsum(cls2)
    for i in 1:size(lrs, 2)
        st, en = lrs[:, i]
        a1 = ccum1[en+1] - ccum1[st]
        a2 = ccum2[en+1] - ccum2[st]
        push!(ans, a1 => a2)
    end
    ans
end

function main()
    inputs = readlines()
    n = parse.(Int64, inputs[1])
    cps = hcat([parse.(Int64, split(x)) for x in inputs[2:n+1]]...)
    q = parse.(Int64, inputs[n+2])
    lrs = hcat([parse.(Int64, split(x)) for x in inputs[n+3:n+q+2]]...)
    for (a1, a2) in score_sum(cps, lrs)
        println("$(a1) $(a2)")
    end
end

main()
