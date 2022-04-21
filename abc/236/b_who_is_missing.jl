function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    s = 4 * n * (n + 1) ÷ 2
    a = s - sum(as)
    println(a)
end

main()
