function picktwo(n, as)
    cost = zeros(Int64, (2 * n, n))
    cost[1:2*n-1, 1] = abs.(diff(as))
    for k in 2:n
        for i in 1:2*(n-k)+1
            c = cost[i+1, k-1] + abs(as[i] - as[i+2*k-1])
            for j = 1:k-1
                c = min(c, cost[i, j] + cost[i+2*j, k-j])
            end
            cost[i, k] = c
        end
    end
    cost[1, n]
end

function main()
    n = parse(Int64, readline())
    as = parse.(Int64, split(readline()))
    println(picktwo(n, as))
end

main()
