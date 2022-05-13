function main()
    s = readline()
    fs = [x == '1' for x in s]
    res = typemax(Int)
    for a in [true, false]
        b = a
        paint = 0
        for x in fs
            paint += x != b
            b = !b
        end
        res = min(res, paint)
    end
    println(res)
end

main()
