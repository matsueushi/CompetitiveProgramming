function solve(n, d, x, as)
    ans = x
    for i in 1:n
        ans += 1 + (d - 1) ÷ as[i]
    end
    ans
end

function main()
    n = parse(Int, readline())
    d, x = parse.(Int, split(readline()))
    as = zeros(Int, n)
    for i in 1:n
        as[i] = parse(Int, readline())
    end
    println(solve(n, d, x, as))
end

main()
