function main()
    a, b, k = parse.(Int, split(readline()))
    l = min(a + k - 1, b)
    for i in a:l
        println(i)
    end
    for i in max(b - k + 1, l + 1):b
        println(i)
    end
end

main()
