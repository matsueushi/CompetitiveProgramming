function main()
    n = parse(Int, readline())

    up = Int(cld(n, 1.08))
    down = Int(fld(n, 1.08))
    for t in (up, down)
        x = floor(Int, t * 1.08)
        if x == n
            println(t)
            return
        end
    end
    println(":(")
end

main()
