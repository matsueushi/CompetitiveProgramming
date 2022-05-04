function solve(n)
    digits = Int[]
    while n > 0
        n, r = divrem(n, 10)
        push!(digits, r)
    end
    sort!(digits, rev=true)
    l = length(digits)
    res = 0
    for i in 1:2^(l+1)-1
        a = 0
        b = 0
        for j in 0:l-1
            if i >> j & 1 == 1
                a *= 10
                a += digits[j+1]
            else
                b *= 10
                b += digits[j+1]
            end
            res = max(res, a * b)
        end
    end
    res
end

function main()
    n = parse(Int, readline())
    println(solve(n))
end

main()
