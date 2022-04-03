function main()
    lines = readlines()
    n = parse(Int64, lines[1])
    data = [parse.(Int64, w) for w in split.(lines[2:n+1])]
    t, x, y = 0, 0, 0
    for (ti, xi, yi) in data
        z = abs(xi - x) + abs(yi - y)
        dt = ti - t
        if z > dt || mod(z - dt, 2) == 1
            println("No")
            return
        end
        t, x, y = ti, xi, yi
    end
    println("Yes")
end

main()