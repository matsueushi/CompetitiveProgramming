function divisors(n)
    lowers = Int[]
    uppers = Int[]
    i = 1
    isqrtn = isqrt(n)
    for i in 1:isqrtn
        if n % i == 0
            push!(lowers, i)
            if i != n ÷ i
                push!(uppers, n ÷ i)
            end
        end
    end
    vcat(lowers, reverse(uppers))
end

parseint() = parse(Int, readline())

function main()
    n = parseint()
    divs = divisors(n)
    res = typemax(Int)
    for i in 1:length(divs)÷2+1
        res = min(res, divs[i] + n ÷ divs[i])
    end
    println(res - 2)
end

main()
