function coins(n, a, b, c)
    a, b, c = sort([a, b, c])
    m = typemax(Int64)
    cmax = min(9999, n ÷ c)
    for ci in 0:cmax
        rc = n - ci * c
        bmax = min(9999 - ci, rc ÷ b)
        for bi in 0:bmax
            rb = rc - bi * b
            ai, ra = divrem(rb, a)
            ra == 0 && (m = min(m, ai + bi + ci))
        end
    end
    m
end

function main()
    n = parse(Int64, readline())
    a, b, c = parse.(Int64, split(readline()))
    println(coins(n, a, b, c))
end

main()
