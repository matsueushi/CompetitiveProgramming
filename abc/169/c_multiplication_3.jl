function main()
    x, y = split(readline())
    a = parse(Int, x)
    b = parse(Float64, y)
    c = round(Int, b * 100)
    au, al = divrem(a, 100)
    println(au * c + (al * c ÷ 100))
end

main()
