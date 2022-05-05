function base10(x, k)
    a = 0
    p = 1
    while x > 0
        x, r = divrem(x, 10)
        a += r * p
        p *= k
    end
    a
end

solve(k, a, b) = base10(a, k) * base10(b, k)

function main()
    k = parse(Int, readline())
    a, b = parse.(Int, split(readline()))
    println(solve(k, a, b))
end

main()
