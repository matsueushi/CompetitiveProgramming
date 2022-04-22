f(x) = x^2 + 2 * x + 3

function main()
    t = parse(Int, readline())
    println(f(f(f(t) + t) + f(f(t))))
end

main()
