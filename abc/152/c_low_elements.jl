function main()
    n = parse(Int, readline())
    ps = parse.(Int, split(readline()))
    pmin = typemax(Int)
    res = 0
    for i in 1:n
        ps[i] ≤ pmin && (res += 1)
        pmin = min(pmin, ps[i])
    end
    println(res)
end

main()
