function main()
    h, w = parse.(Int, split(readline()))
    if h == 1 || w == 1
        println(1)
    else
        a, b = divrem(w, 2)
        println(h * a + cld(h, 2) * b)
    end
end

main()
