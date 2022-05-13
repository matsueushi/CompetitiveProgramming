function main()
    n = parse(Int, readline())
    s = readline()
    x = 0
    res = 0
    for i in 1:n
        if s[i] == 'I'
            x += 1
        else
            x -= 1
        end
        res = max(res, x)
    end
    println(res)
end

main()
