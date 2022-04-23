function main()
    a, b, c, d, e, f, x = parse.(Int, split(readline()))
    tu, tv = divrem(x, a + c)
    au, av = divrem(x, d + f)
    dt = (a * tu + min(a, tv)) * b
    da = (d * au + min(d, av)) * e
    if dt == da
        println("Draw")
    elseif dt > da
        println("Takahashi")
    else
        println("Aoki")
    end
end

main()
