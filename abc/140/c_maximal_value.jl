function main()
    n = parse(Int, readline())
    bs = parse.(Int, split(readline()))
    res = first(bs) + last(bs)
    for i in 2:n-1
        res += min(bs[i-1], bs[i])
    end
    println(res)
end

main()
