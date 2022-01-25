function main()
    n, price = parse.(Int64, split(readline()))
    price = price ÷ 1000
    for x in 0:min(n, fld(price, 10))
        for y in 0:min(n - x, fld(price - 10 * x, 5))
            z = n - x - y
            if 10 * x + 5 * y + z == price
                println("$x $y $z")
                return
            end
        end
    end
    println("-1 -1 -1")
end

main()