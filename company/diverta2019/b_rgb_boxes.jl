function main()
    r, g, b, n = parse.(Int, split(readline()))
    res = 0
    for x in 0:n÷r
        n0 = n - r * x
        for y in 0:n0÷g
            n1 = n0 - g * y
            n1 % b == 0 && (res += 1)
        end
    end
    println(res)
end

main()
