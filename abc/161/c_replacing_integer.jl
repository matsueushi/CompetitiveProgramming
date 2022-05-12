function main()
    n, k = parse.(Int, split(readline()))
    x = n % k
    println(min(x, k - x))
end

main()
