function solve(n)
    isodd(n) && return 0
    res = 0
    m = n ÷ 2
    while m > 0
        m ÷= 5
        res += m
    end
    res
end

function main()
    n = parse(Int, readline())
    println(solve(n))
end

main()
