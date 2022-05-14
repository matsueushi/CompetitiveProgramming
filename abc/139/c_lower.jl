function main()
    n = parse(Int, readline())
    hs = parse.(Int, split(readline()))
    res = 0
    cur = 0
    for i in 2:n
        if hs[i] ≤ hs[i-1]
            cur += 1
        end
        if hs[i] > hs[i-1] || i == n
            res = max(res, cur)
            cur = 0
        end
    end
    println(res)
end

main()
