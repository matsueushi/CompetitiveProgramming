function solve(n)
    i = 2
    ne = 0
    rem = n
    while i^2 ≤ n
        while rem % i == 0
            rem ÷= i
            ne += 1
        end
        rem == 1 && break
        i += 1
    end
    rem > 1 && (ne += 1)
    res = 0
    while ne > 1
        ne = cld(ne, 2)
        res += 1
    end
    res
end

function main()
    n = parse(Int64, readline())
    println(solve(n))
end

main()
