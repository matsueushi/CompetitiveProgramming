function solve(n, m, as, bs)
    graph = [Int64[] for _ in 1:n]
    for i in 1:m
        if as[i] > bs[i]
            push!(graph[as[i]], bs[i])
        else
            push!(graph[bs[i]], as[i])
        end
    end
    res = 0
    for i in 1:n
        length(graph[i]) == 1 && (res += 1)
    end
    res
end

function main()
    n, m = parse.(Int64, split(readline()))
    as = zeros(Int64, m)
    bs = zero(as)
    for i in 1:m
        as[i], bs[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, m, as, bs))
end

main()
