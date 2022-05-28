parseint() = parse(Int, readline())

function main()
    n = parseint()
    res = 1
    for i in 1:n
        res = res * i % (10^9 + 7)
    end
    println(res)
end

main()
