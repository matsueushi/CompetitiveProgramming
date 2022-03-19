function solve(n)
    ds = Int64[]
    i = 1
    while i^2 ≤ n
        x, r = divrem(n, i)
        if r == 0
            push!(ds, i)
            x != i && push!(ds, x)
        end
        i += 1
    end
    sort!(ds)
    res = 0
    l = length(ds)
    for i in 1:l
        for j in i:l
            n ÷ ds[i] < ds[j] && continue
            m, r = divrem(n ÷ ds[i], ds[j])
            r != 0 && continue
            m ≥ ds[j] && (res += 1)
        end
    end
    res
end

function main()
    n = parse(Int64, readline())
    println(solve(n))
end

main()
