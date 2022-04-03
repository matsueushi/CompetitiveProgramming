function main()
    n = readline()
    t = readline()
    x = y = 0
    d = 0
    dx = [1, 0, -1, 0]
    dy = [0, -1, 0, 1]
    for s in t
        if s == 'S'
            x += dx[d+1]
            y += dy[d+1]
        else
            d += 1
            d %= 4
        end
    end
    println("$x $y")
end

main()
