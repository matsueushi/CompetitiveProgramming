parseint() = parse(Int, readline())

function solve(n)
    res = Int[]
    for i in 0:60
        if n >> i & 1 == 1
            push!(res, 1)
            n -= (-1)^i * (1 << i)
        else
            push!(res, 0)
        end
        n == 0 && break
    end
    join(reverse(res))
end

function main()
    n = parseint()
    solve(n) |> println
end

main()
