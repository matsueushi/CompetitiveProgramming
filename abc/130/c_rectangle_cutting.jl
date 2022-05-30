parseints() = parse.(Int, split(readline()))

function main()
    w, h, x, y = parseints()
    s = w * h / 2
    m = Int(w == 2 * x && h == 2 * y)
    println("$s $m")
end

main()
