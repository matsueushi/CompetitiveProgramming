function main()
    n, k, a = parse.(Int, split(readline()))
    println(mod1(a + k - 1, n))
end

main()
