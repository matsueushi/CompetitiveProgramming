function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    sort!(as)
    x = last(as)
    m = (x + 1) ÷ 2
    ind_0 = searchsortedlast(as[1:end-1], m)
    a = as[ind_0]
    ind_1 = searchsortedfirst(as[1:end-1], m)
    if ind_1 < n
        x - as[ind_1] > a && (a = as[ind_1])
    end
    println("$(x) $(a)")
end

main()
