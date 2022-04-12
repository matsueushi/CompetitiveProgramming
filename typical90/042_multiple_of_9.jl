function multiple_of_nine(k)
    k % 9 == 0 || return 0
    m = 10^9 + 7
    dsumc = zeros(Int64, k)
    for i in 1:k
        for d in 1:9
            if i - d ≥ 1
                dsumc[i] += dsumc[i-d]
                dsumc[i] %= m
            end
        end
        if i ≤ 9
            dsumc[i] += 1
        end
    end
    last(dsumc)
end

function main()
    k = parse(Int64, readline())
    println(multiple_of_nine(k))
end

main()
