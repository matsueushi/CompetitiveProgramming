function main()
    n = parse(Int, readline())
    s = readline()
    res = 0
    for i in 1:n-1
        h = Set(s[1:i])
        t = Set(s[i+1:end])
        res = max(res, length(h ∩ t))
    end
    println(res)
end

main()
