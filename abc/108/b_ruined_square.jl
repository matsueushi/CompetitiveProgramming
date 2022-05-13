function main()
    x1, y1, x2, y2 = parse.(Int, split(readline()))
    v = [x2 - x1, y2 - y1]
    m = [0 -1; 1 0]
    v = m * v
    x3, y3 = [x2, y2] + v
    v = m * v
    x4, y4 = [x3, y3] + v
    println("$x3 $y3 $x4 $y4")
end

main()
