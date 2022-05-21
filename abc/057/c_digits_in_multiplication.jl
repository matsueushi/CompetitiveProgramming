parseint() = parse(Int, readline())

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

function ndigits(n)
    i = 1
    while n ÷ 10 > 0
        n ÷= 10
        i += 1
    end
    i
end

function solve(n)
    divs = divisors(n)
    n = length(divs)
    if isodd(n)
        ndigits(divs[n÷2+1])
    else
        m = n ÷ 2
        max(ndigits(divs[m]), ndigits(divs[m+1]))
    end
end

function main()
    n = parseint()
    println(solve(n))
end

main()
