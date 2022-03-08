function solve(n, s)
    res = n * (n - 1) ÷ 2
    a = s[1]
    k = 1
    for i in 2:n
        if a == s[i]
            k += 1
        else
            a = s[i]
            res -= k * (k - 1) ÷ 2
            k = 1
        end
    end
    res -= k * (k - 1) ÷ 2
    res
end

function main()
    n = parse(Int64, readline())
    s = readline()
    println(solve(n, s))
end

main()
